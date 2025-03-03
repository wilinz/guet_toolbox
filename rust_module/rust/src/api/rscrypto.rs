use base64::Engine;
use hex::{self, decode as hex_decode, encode as hex_encode};
use openssl::symm::{decrypt, encrypt, Cipher};
use rand::distr::Alphanumeric;
use rand::{rng, Rng};

#[flutter_rust_bridge::frb(sync)]
pub fn get_encrypt_web_vpn_host(plaintext: &str, key: &[u8], iv: &[u8]) -> String {
    let cipher = Cipher::aes_128_cfb128();
    let encrypted =
        encrypt(cipher, key, Some(iv), plaintext.as_bytes()).expect("Encryption failed");
    hex_encode(encrypted)
}

#[flutter_rust_bridge::frb(sync)]
pub fn get_decrypt_web_vpn_host(ciphertext: &str, key: &[u8], iv: &[u8]) -> String {
    let ct = hex_decode(ciphertext).expect("Invalid hex");
    let cipher = Cipher::aes_128_cfb128();
    let decrypted = decrypt(cipher, key, Some(iv), &ct).expect("Decryption failed");
    String::from_utf8(decrypted).expect("Invalid UTF-8")
}

#[flutter_rust_bridge::frb(sync)]
pub fn get_web_vpn_url(url: &str, key: &[u8], iv: &[u8], vpn_base_url: &str) -> String {
    let parts: Vec<&str> = url.splitn(2, "://").collect();
    if parts.len() < 2 {
        return String::new();
    }
    let pro = parts[0];
    let add = parts[1];

    let host_path: Vec<&str> = add.splitn(2, '/').collect();
    let host_part = host_path[0];
    let fold_part = if host_path.len() > 1 {
        host_path[1]
    } else {
        ""
    };

    let (domain, port_suffix) = match host_part.split_once(':') {
        Some((d, p)) => (d, format!("-{}", p)),
        None => (host_part, String::new()),
    };

    let cph = get_encrypt_web_vpn_host(domain, key, iv);
    let iv_hex = hex_encode(iv);

    format!(
        "{}/{}{}/{}{}/{}",
        vpn_base_url, pro, port_suffix, iv_hex, cph, fold_part
    )
}

#[flutter_rust_bridge::frb(sync)]
pub fn get_web_vpn_ordinary_url(url: &str, key: &[u8], iv: &[u8]) -> String {
    let parts: Vec<&str> = url.split('/').collect();
    if parts.len() < 5 {
        return String::new();
    }
    let pro = parts[3];
    let key_cph = parts[4];

    let hex_iv = hex_encode(iv);

    if key_cph.len() >= 16 && &key_cph[..16] == &hex_iv {
        if key_cph.len() >= 32 {
            println!("error: key_cph: {}", &key_cph[..32]);
        }
        String::new()
    } else {
        if key_cph.len() < 32 {
            return String::new();
        }
        let encrypted_host = &key_cph[32..];
        let hostname = get_decrypt_web_vpn_host(encrypted_host, key, iv);
        let fold = if parts.len() > 5 {
            parts[5..].join("/")
        } else {
            String::new()
        };
        let pro_parts: Vec<&str> = pro.splitn(2, '-').collect();
        let (protocol, port) = if pro_parts.len() > 1 {
            (pro_parts[0], format!(":{}", pro_parts[1]))
        } else {
            (pro_parts[0], String::new())
        };
        format!("{}://{}{}/{}", protocol, hostname, port, fold)
    }
}

#[flutter_rust_bridge::frb(sync)]
// 加密函数
pub fn encrypt_aes_128_cbc_64prefix(plain: &str, key: &[u8]) -> String {
    if key.len() != 16 && key.len() != 24 && key.len() != 32 {
        panic!("Key must be 16, 24, or 32 bytes long");
    }

    // 生成随机的 IV（16 字节）
    let mut iv = [0u8; 16];
    rng().fill(&mut iv);

    // 生成 64 字节的随机字符串

    let random_str: String = rng()
        .sample_iter(&Alphanumeric)
        .take(64)
        .map(char::from)
        .collect();

    // 拼接随机字符串和密码
    let plaintext = format!("{}{}", random_str, plain);

    // 使用 AES-CBC 加密
    let cipher = Cipher::aes_128_cbc(); // 根据密钥长度选择 AES-128/192/256
    let encrypted =
        encrypt(cipher, &key, Some(&iv), plaintext.as_bytes()).expect("Encryption failed");

    base64::engine::general_purpose::STANDARD.encode(&encrypted)
}

#[flutter_rust_bridge::frb(sync)]
// 解密函数
pub fn decrypt_aes_128_cbc_64prefix(encrypted_base64: &str, key: &[u8]) -> String {
    // 将密钥转换为字节数组
    if key.len() != 16 && key.len() != 24 && key.len() != 32 {
        panic!("Key must be 16, 24, or 32 bytes long");
    }

    // 解码 Base64
    let encrypted_data = base64::engine::general_purpose::STANDARD
        .decode(encrypted_base64)
        .expect("Invalid Base64");

    // 生成随机的 IV（16 字节）
    let mut iv = [0u8; 16];
    rng().fill(&mut iv);

    // 使用 AES-CBC 解密
    let cipher = Cipher::aes_128_cbc(); // 根据密钥长度选择 AES-128/192/256
    let decrypted = decrypt(cipher, &key, Some(&iv), &encrypted_data)
        .expect("Decryption failed")
        .split_off(64);

    // 将解密结果转换为字符串
    let decrypted_str = String::from_utf8(decrypted).expect("Invalid UTF-8");

    // 提取原始密码（去掉前面的 64 字节随机字符串）
    decrypted_str
}

#[flutter_rust_bridge::frb(init)]
pub fn init_app() {
    // Default utilities - feel free to customize
    flutter_rust_bridge::setup_default_user_utils();
}

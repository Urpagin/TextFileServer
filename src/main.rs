use actix_files::NamedFile;
use actix_web::{get, App, HttpServer};

/// Served address/port
const ADDRESS: (&str, u16) = ("0.0.0.0", 8080);

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| App::new().service(serve_text_file))
        .bind(ADDRESS)?
        .run()
        .await
}

#[get("/")]
async fn serve_text_file() -> actix_web::Result<NamedFile> {
    Ok(NamedFile::open("text.txt")?)
}

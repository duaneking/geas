use lambda_http::{handler, lambda_runtime::{self, Context, Error}, IntoResponse, Request, RequestExt};


#[tokio::main]
async fn main() -> Result<(), Error> {
    lambda_runtime::run(handler(|event: Request, ctx: Context| {
        request_main(event, ctx)
    }))
    .await?;
    Ok(())
}

pub async fn request_main(request: Request, _ctx: Context) -> Result<impl IntoResponse, Error> {
   println!("{:?}", request);

   Ok(format!(
        "hello {}",
        request
            .query_string_parameters()
            .get("username")
            .unwrap_or_else(|| ".")
    ))
}

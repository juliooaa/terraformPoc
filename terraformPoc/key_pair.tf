resource "aws_key_pair" "clickhouse-dev" {
    key_name = "clickhouse-dev"
    public_key = file("./keys/clickhouse-dev.pem")
}
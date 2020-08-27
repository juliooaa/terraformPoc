module "clickhouse-dev-server" {
    source = "./clickhouse-server"
    ami-id = "ami-0ce21b51cb31a48b8"
    key-pair = aws_key_pair.clickhouse-dev.key_name
    name = "poc-clickhouse"
}
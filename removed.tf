removed {
  from = aws_instance.test

  lifecycle {
    destroy = false
  }
}

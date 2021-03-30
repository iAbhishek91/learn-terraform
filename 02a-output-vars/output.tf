output "myout" {
  value = {
      var1 = "abhishek",
      var2 = {
          nested01 = "inside var2"
      }
      var3 = 10
      var4 = [true, false]
  }
  sensitive = true
  description = "bla bla"
}
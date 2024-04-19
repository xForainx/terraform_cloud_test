#Création d'un fichier où se trouve la valeur de l'IP publique
# resource "local_file" "public_ip_address" {
#     content  = <<-EOL
#     IP machine master = ${module.public_ip_master.pub_ip.ip_address}
#     EOL
#     filename = "info_vm.txt"
# }
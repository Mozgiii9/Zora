#!/bin/bash

# Функция для отображения логотипа
display_logo() {
  echo -e '\e[40m\e[32m'
  echo -e '███╗   ██╗ ██████╗ ██████╗ ███████╗██████╗ ██╗   ██╗███╗   ██╗███╗   ██╗███████╗██████╗ '
  echo -e '████╗  ██║██╔═══██╗██╔══██╗██╔════╝██╔══██╗██║   ██║████╗  ██║████╗  ██║██╔════╝██╔══██╗'
  echo -e '██╔██╗ ██║██║   ██║██║  ██║█████╗  ██████╔╝██║   ██║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝'
  echo -e '██║╚██╗██║██║   ██║██║  ██║██╔══╝  ██╔══██╗██║   ██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗'
  echo -e '██║ ╚████║╚██████╔╝██████╔╝███████╗██║  ██║╚██████╔╝██║ ╚████║██║ ╚████║███████╗██║  ██║'
  echo -e '╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝'
  echo -e '\e[0m'
  echo -e "\nПодписаться на канал may.crypto{🦅} чтобы быть в курсе самых актуальных нод - https://t.me/maycrypto\n"
}

# Функция для установки ноды Zora
install_zora_node() {
  read -p "Введите RPC ссылку из Alchemy(Ethereum Mainnet): " rpc_link
  echo "Начинаем установку..."
  sudo curl -fsSL https://get.docker.com -o install-docker.sh
  sudo sh install-docker.sh
  sudo apt-get update && sudo apt-get upgrade -y
  sudo apt install docker-compose screen -y
  sudo apt-get install ca-certificates curl gnupg -y
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose -y
  git clone https://github.com/conduitxyz/node.git
  cd node
  ./download-config.py zora-mainnet-0
  export CONDUIT_NETWORK=zora-mainnet-0
  cp .env.example .env
  sed -i "s|OP_NODE_L1_ETH_RPC=.*|OP_NODE_L1_ETH_RPC=$rpc_link|" .env
  sed -i "s|OP_NODE_L1_BEACON=.*|OP_NODE_L1_BEACON=https://beaconstate.info/|" .env
  screen -dmS Zora docker compose up --build
  echo "Установка ноды Zora завершена! Следить за состоянием ноды можно через 2 пункт меню, а запросы ноды будут отображаться у Вас в Alchemy"
}

# Функция для проверки состояния ноды Zora
check_zora_node() {
  echo "Через 15 секунд начнется отображение логов Zora. Чтобы выйти из отображения нажмите CTRL+A, затем D"
  sleep 15
  screen -r Zora
  echo "Выход в меню..."
}

# Меню скрипта
menu() {
  while true; do
    display_logo
    echo "Меню:"
    echo "1. Установить ноду Zora"
    echo "2. Проверить состояние ноды Zora"
    echo "3. Выйти из скрипта"
    read -p "Выберите пункт меню: " choice
    case $choice in
      1)
        install_zora_node
        ;;
      2)
        check_zora_node
        ;;
      3)
        exit 0
        ;;
      *)
        echo "Неверный выбор. Пожалуйста, выберите корректный пункт меню."
        ;;
    esac
  done
}

menu

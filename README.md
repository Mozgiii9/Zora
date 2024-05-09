![image](https://github.com/Mozgiii9/Zora/assets/74683169/10457959-a93a-48e2-b36b-b106040ca546)


# Zora

## В данном гайде представлен обзор проекта Zora, а также подробная инструкция по установке ноды в проекте.

**Zora** — это Layer-2 решение на Ethereum и NFT Marketplace. Также они предоставляют различные SDK для разработчиков.

**Инвестировали: $60 000 000**

**Инвесторы: Paradigm, Coinbase Ventures и другие**

**Характеристики для сервера:**

- **CPU: 4-6 cores;**
- **RAM: 16 GB:**
- **Storage: 200 GB SSD;**
- **OS: Ubuntu 22.04**

*Удобный [сервис](https://ru.hostings.info/hostings/filter_page#vps) для выбора подходящего хостинга*

## Инструкция по установке ноды:

**1. Переходим в [Alchemy](https://www.alchemy.com/), регистрируем аккаунт если ранее этого не сделали. Создаем новое приложение нажав на кнопку Create new app.**

![image](https://github.com/Mozgiii9/Zora/assets/74683169/098d3ab4-ba4c-4dd3-bf02-ac6f2fca6a36)

**2. В поле Name указываем Zora, описание добавлять необязательно. Chain и Network оставляем Ethereum и Ethereum Mainnet соответственно.**

![image](https://github.com/Mozgiii9/Zora/assets/74683169/fc74b1d5-1a85-4d22-bffc-3f644de66cf3)

**3. После того, как успешно создали приложение переходим к серверу. Выполним обновление пакетов:**

```bash

sudo apt-get update && sudo apt-get upgrade -y

```

**4. Устанавливаем необходимое ПО для работы ноды:**

```bash

sudo apt install curl build-essential git screen jq pkg-config libssl-dev libclang-dev ca-certificates gnupg lsb-release -y

```

**5. Отдельно устанавливаем Docker на сервер. Выполните команды по очереди:**

```bash

sudo mkdir -p /etc/apt/keyrings

```

```bash

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

```

```bash

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

```

```bash

sudo chmod a+r /etc/apt/keyrings/docker.gpg

```

**6. Еще раз обновим пакеты:**

```bash

sudo apt-get update

```

```bash

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose

```

**7. Скачиваем ПО Zora:**

```bash

git clone https://github.com/conduitxyz/node.git

```

![image](https://github.com/Mozgiii9/Zora/assets/74683169/cccb3d77-af4b-460c-a905-a4e002c927f6)


**8. Переходим в папку Zora:**

```bash

cd node

```

**9. Инициализируем папку:**

```bash

./download-config.py zora-mainnet-0

```

![image](https://github.com/Mozgiii9/Zora/assets/74683169/5590ff98-d0ff-4ca4-bed7-5b3a28c26614)

**10.**

```bash

export CONDUIT_NETWORK=zora-mainnet-0

```

**11. Переходим к редактированию файла с API ключами:**

```bash

cp .env.example .env

```

**12. Открываем текстовый файл:**

```bash

nano .env

```

**13. Копируем из Alchemy API key приложения.**

![image](https://github.com/Mozgiii9/Zora/assets/74683169/8a74f9c4-74b7-4f67-af1e-6c5735731a37)

**14. Переходим обратно к файлу. Замените значение "OP_NODE_L1_ETH_RPC" на скопированный ранее API key. В "OP_NODE_L1_BEACON" вставьте ссылку из примера:**

```

# [recommended] replace with your preferred L1 (Ethereum, not Conduit) node RPC URL:
OP_NODE_L1_ETH_RPC=<HTTP://...> <- Ваш API key
OP_NODE_L1_BEACON=https://beaconstate.info/ <- Заполните данное поле как в примере

```

![image](https://github.com/Mozgiii9/Zora/assets/74683169/acb41df1-3bde-4bef-9f1a-efe764b37a66)


**14. Сохраните файл нажав CTRL+X, далее Y и после Enter.**

**15. Запустите ноду командой:**

```bash

docker compose up --build -d

```

![image](https://github.com/Mozgiii9/Zora/assets/74683169/397ddef3-29a5-444e-9134-f73293f21f59)


*Подождите подготовку контейнеров*

**16. Вы можете проверить логи командой:**

```bash

docker logs -f node-op-node-1

```

![image](https://github.com/Mozgiii9/Zora/assets/74683169/26e5895b-b35e-416f-baf3-58015dccc94c)

**В Вашем профиле Alchemy отобразится информация об аптайме ноды**

![image](https://github.com/Mozgiii9/Zora/assets/74683169/e6589f8d-28f5-46dd-b295-f124fd75fe4c)

### Обязательно проведите собственный ресерч проектов перед тем как ставить ноду. Сообщество NodeRunner не несет ответственность за Ваши действия и средства. Помните, проводя свой ресёрч, Вы учитесь и развиваетесь.

### Связь со мной: [Telegram(@M0zgiii)](https://t.me/m0zgiii)

### Мои соц. сети: [Twitter](https://twitter.com/m0zgiii) 







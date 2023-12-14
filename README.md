# Furniture Shop App
**Futniture Shop App** - e-commerce мобильное приложение на Flutter по [Figma макету](https://www.figma.com/file/2c5kVBLebmqIkfrInzz7KS/Furniture-Shopping---Minimal-UI-Kit-(Community))
## *Фичи* приложения

✅ - Готовые, 🚧 - в процессе добавления  
<br/><br/>
✅ Авторизация
  - ✅ Регистрация по почте и паролю
  - ✅ Вход по почте и паролю
  - ✅ Вход c анонимного аккаунта
  - 🚧 Регистрация и вход по телефону
  - 🚧 Регистрация с анонимного аккаута в полноценный с сохранением данных
  - 🚧 Восстановление пароля
    
✅ Экраны товаров и действия над ними
  - ✅ Просморт списка товаров по категориям
  - ✅ Поиск товаров по имени
  - ✅ Добавление и удаление товаров из ***избранного***
  - ✅ Добавление количества товаров и их удаление из ***корзины***
  - ✅ Сохранение состояния этих списков для каждого пользователя в ***Firebase***
  - ✅ **Реактивное и оптимизированное взаимодействие этих 3-х экранов и их данных**
  - 🚧 Возможность сделать заказ товаров из корзины

✅ Остальное
  - ✅ Автоматический роутинг исходя из статуса аутентификации пользователя
  - ✅ Возможность сменить фото пользователя из галереи или камеры с привязкой к ***Firebase***
  - 🚧 Возможность сделать заказ с указанным местоположением через **google_maps_flutter***
  - 🚧 Добавление уведомлений через ***flutter_local_notifications***
  - 🚧 Добавить поддержку deep-link
  - 🚧 Изменить нативный splash-screen
  - 🚧 Добавить еще больше анимаций переходов
  - 🚧 <sub>Еще много других, которые я благополучно забыл</sub>

## Демонстрация приложения

### Регистрация через почту
[Регистрация через почту](https://github.com/evendelger/furniture_shop_app/assets/89094428/904c048e-9963-4ca6-8a5a-dd16640401f3)

### Логин через почту
[Логин через почту](https://github.com/evendelger/furniture_shop_app/assets/89094428/6018066c-fc90-4174-9975-14d2993bf79a)

### Анонимный логин
[Анонимный логин](https://github.com/evendelger/furniture_shop_app/assets/89094428/8d50eacd-20e4-476c-896d-7c79a28244a2)

### Взаимодействие экранов товаров, корзины и избранного
[Экраны товаров](https://github.com/evendelger/furniture_shop_app/assets/89094428/3912a102-d42f-40f3-a893-6b3afdc807f5)

### Поиск товаров по имени
[Поиск товаров](https://github.com/evendelger/furniture_shop_app/assets/89094428/efba42b2-c8e7-4b32-b9f9-7ac1e3630a18)

### Смена фото пользователя
[Смена фото](https://github.com/evendelger/furniture_shop_app/assets/89094428/e38b8d89-439e-40d8-97eb-95fa1c249a9f)

## Пару слов про Backend
Поскольку нужно было кастомное api с различными вариантами запроса, а я далек от его создания с серверной части, то в качестве backend'a пришлось использовать такой замечательный сервис, как [Fastgen](https://www.fastgen.com). В нем можно создать свою базу PostgreSQL и получать конкретные данные из нее исходя из параметров rest api запроса.
<br/><br/>
Как пример, все это можно настроить в виде такого графа.

<img src="https://github.com/evendelger/furniture_shop_app/assets/89094428/df14366a-5661-4bfe-8c6a-0167e504c4ed" alt="Граф" width="600"/>

## Используемые пакеты(стек)
- State Manager - `bloc`
- Service Locator - `get_it`
- Network - `dio`
- Routing - `go_router`
- Data Classes - `freezed, json_serializable`
- Authentication - `firebase_auth`
- Cloud Database - `cloud_firestore`
- Cloud Storage - `firebase_storage`
- Logger - `talker`
- `provider`
- `shimmer`
- `permission_handler`
- `image_picker`
- `cached_network_image`
- `flutter_animate`
- и другие...  
<sub>P.S. Ранее было реализовано хранение данных через `sqflite`, но перешел на `cloud_firestore`</sub>

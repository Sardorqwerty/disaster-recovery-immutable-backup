# Disaster Recovery & Immutable Backup

## O‘zbekcha

### Loyiha haqida

Ushbu loyiha Linux serveridagi muhim ma’lumotlarni Restic yordamida zaxiralash, backup nusxalarini append-only rejimida saqlash va kerak bo‘lganda ma’lumotlarni tiklash jarayonini sinash uchun yaratildi.

Loyihaning maqsadi — zaxira nusxalarini avtomatlashtirish, ularni o‘chirish yoki o‘zgartirishdan himoyalash va tiklash jarayonini amalda tekshirish.

### Arxitektura

| Server | IP manzili | Operatsion tizim | Vazifasi |
|---|---|---|---|
| SRV-PROD | 10.99.0.10 | Debian | Asosiy server va backup manbasi |
| SRV-BACKUP | 10.99.0.20 | Ubuntu | Backup nusxalarini saqlash |
| SRV-RECOVERY | Hali belgilanmagan | Debian/Ubuntu | Favqulodda tiklash uchun mo‘ljallangan server |

### Ishlatilgan texnologiyalar

- Debian / Ubuntu Linux
- Restic
- Restic REST Server
- Bash
- Cron

### Backup jarayoni

SRV-PROD serveridagi `/opt/portfolio-data` katalogi Restic yordamida zaxiralanadi.

Backup nusxalari SRV-BACKUP serveridagi `/srv/immutable` repository’sida saqlanadi. Restic REST Server `8000` portida ishlaydi va repository append-only rejimida sozlangan.

### Avtomatlashtirish

Backup skripti:

`/home/user/immutable-backup.sh`

Skript Cron orqali har kuni soat 02:00 da ishga tushishi uchun sozlangan. Natijalar quyidagi log faylga yoziladi:

`/home/user/immutable-backup.log`

### Recovery testi

Restore testi quyidagi skript yordamida bajarildi:

`/home/user/restore-test.sh`

Ma’lumotlar `/home/user/recovery-test` katalogiga tiklandi. Tiklangan fayl tekshirildi va ma’lumot muvaffaqiyatli tiklangani tasdiqlandi.

**Eslatma:** Hozircha restore testi SRV-PROD serverining o‘zida bajarilgan. Alohida SRV-RECOVERY serverini sozlash va unga restore qilish keyingi bosqich hisoblanadi.

### Immutable Backup testi

Repository uchun append-only rejimi sinovdan o‘tkazildi. Snapshot’ni o‘chirishga urinish server tomonidan rad etildi.

### Loyiha holati

- [x] Restic va REST Server o‘rnatildi
- [x] Backup repository yaratildi
- [x] Backup skripti tayyorlandi
- [x] Cron orqali avtomatik backup sozlandi
- [x] Restore testi bajarildi
- [x] Append-only rejimi tekshirildi
- [ ] Alohida Recovery Server sozlanadi
- [ ] Recovery Server’ga restore testi bajariladi

### Xavfsizlik

Parollar, maxfiy kalitlar, `.env` fayllari va haqiqiy backup ma’lumotlari ushbu repository’ga joylanmaydi.

---

## Русский

### О проекте

Проект создан для резервного копирования важных данных Linux-сервера с помощью Restic, хранения резервных копий в режиме append-only и проверки восстановления данных.

Цель проекта — автоматизировать резервное копирование, защитить копии от удаления или изменения и проверить процесс восстановления на практике.

### Архитектура

| Сервер | IP-адрес | Операционная система | Назначение |
|---|---|---|---|
| SRV-PROD | 10.99.0.10 | Debian | Основной сервер и источник резервного копирования |
| SRV-BACKUP | 10.99.0.20 | Ubuntu | Хранение резервных копий |
| SRV-RECOVERY | Пока не назначен | Debian/Ubuntu | Сервер для аварийного восстановления |

### Используемые технологии

- Debian / Ubuntu Linux
- Restic
- Restic REST Server
- Bash
- Cron

### Процесс резервного копирования

Каталог `/opt/portfolio-data` на SRV-PROD резервируется с помощью Restic.

Резервные копии хранятся в repository `/srv/immutable` на сервере SRV-BACKUP. Restic REST Server работает на порту `8000`, а repository настроен в режиме append-only.

### Автоматизация

Скрипт резервного копирования:

`/home/user/immutable-backup.sh`

Скрипт настроен на ежедневный запуск в 02:00 через Cron. Результаты записываются в лог:

`/home/user/immutable-backup.log`

### Тест восстановления

Тест восстановления выполнен с помощью скрипта:

`/home/user/restore-test.sh`

Данные были восстановлены в каталог `/home/user/recovery-test`. Восстановленный файл был проверен, успешное восстановление подтверждено.

**Примечание:** На данный момент тест восстановления выполнен на самом SRV-PROD. Настройка отдельного сервера SRV-RECOVERY и восстановление данных на него запланированы на следующий этап.

### Проверка Immutable Backup

Режим append-only был протестирован. Попытка удалить snapshot была отклонена сервером.

### Статус проекта

- [x] Установлены Restic и REST Server
- [x] Создан backup repository
- [x] Подготовлен скрипт резервного копирования
- [x] Настроено автоматическое резервное копирование через Cron
- [x] Выполнен тест восстановления
- [x] Проверен режим append-only
- [ ] Настроить отдельный Recovery Server
- [ ] Выполнить восстановление на Recovery Server

### Безопасность

Пароли, секретные ключи, файлы `.env` и реальные резервные копии не размещаются в этом repository.

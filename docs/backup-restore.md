Backup va tiklash / Резервное копирование и восстановление

## O‘zbekcha

### Maqsad

Ushbu hujjat loyihada backup yaratish, uning natijasini tekshirish va ma’lumotlarni tiklash jarayonini tavsiflaydi.

### Backup sozlamalari

- Backup manbasi: SRV-PROD (`10.99.0.10`)
- Zaxiralanadigan katalog: `/opt/portfolio-data`
- Backup server: SRV-BACKUP (`10.99.0.20`)
- Repository katalogi: `/srv/immutable`
- Restic REST Server porti: `8000`
- Avtomatik ishga tushirish: Cron orqali har kuni soat `02:00`

### Backupni ishga tushirish

SRV-PROD serverida:

```bash
/home/user/immutable-backup.sh
```

Natijani tekshirish:

```bash
tail -n 50 /home/user/immutable-backup.log
```

Restic repository’sidagi snapshot’larni ko‘rish:

```bash
restic snapshots
```

Ushbu buyruqlarni bajarishdan oldin Restic repository va parol fayli to‘g‘ri sozlangan bo‘lishi kerak.

### Restore testi

Restore testi quyidagi skript orqali bajariladi:

```bash
/home/user/restore-test.sh
```

Skript ma’lumotlarni quyidagi katalogga tiklaydi:

```text
/home/user/recovery-test
```

Natijani tekshirish:

```bash
tail -n 50 /home/user/restore-test.log
```

Tiklangan fayl mavjudligini tekshirish:

```bash
ls -l /home/user/recovery-test/opt/portfolio-data/
```



### Append-only himoyasini tekshirish

Repository append-only rejimida ishlaydi. Snapshot’ni o‘chirishga urinish server tomonidan rad etilgani testda tasdiqlangan.

Append-only rejimi backup nusxalarini qo‘shimcha himoya qiladi, ammo u alohida, mustaqil va o‘chirishdan himoyalangan storage yoki offline nusxa o‘rnini to‘liq bosa olmaydi.


---

## Русский

### Назначение

Документ описывает процесс создания резервных копий, проверки результата и восстановления данных в рамках проекта.

### Параметры резервного копирования

- Источник: SRV-PROD (`10.99.0.10`)
- Каталог для резервирования: `/opt/portfolio-data`
- Сервер резервных копий: SRV-BACKUP (`10.99.0.20`)
- Каталог repository: `/srv/immutable`
- Порт Restic REST Server: `8000`
- Автоматический запуск: ежедневно в `02:00` через Cron


### Запуск резервного копирования

На сервере SRV-PROD:

```bash
/home/user/immutable-backup.sh
```

Проверка результата:

```bash
tail -n 50 /home/user/immutable-backup.log
```

Просмотр snapshot в repository Restic:

```bash
restic snapshots
```

Перед выполнением команд необходимо правильно настроить repository Restic и файл с паролем.

### Тест восстановления

Тест восстановления запускается следующим скриптом:

```bash
/home/user/restore-test.sh
```

Данные восстанавливаются в каталог:

```text
/home/user/recovery-test
```

Проверка результата:

```bash
tail -n 50 /home/user/restore-test.log
```

Проверка наличия восстановленных файлов:

```bash
ls -l /home/user/recovery-test/opt/portfolio-data/
```


### Проверка защиты append-only

Repository работает в режиме append-only. В ходе теста попытка удалить snapshot была отклонена сервером.

Режим append-only обеспечивает дополнительную защиту резервных копий, но не заменяет отдельное независимое хранилище или offline-копию, защищённую от удаления.


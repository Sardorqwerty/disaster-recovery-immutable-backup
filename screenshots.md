# Backup va tiklash skrinshotlari / Скриншоты резервного копирования и восстановления

## 1.

![Skrinshot 1](./01-screenshot.png)

1. Backup jarayoni: Restic ma’lumotlarni repository’ga muvaffaqiyatli yubordi va yangi snapshot yaratdi.
1. Процесс резервного копирования: Restic успешно отправил данные в repository и создал новый snapshot.

## 2.

![Skrinshot 2](./02-screenshot.png)

2. Snapshotlar ro‘yxati: repository’dagi zaxira nusxasi, uning ID’si, yaratilgan vaqti va katalogi ko‘rsatilgan.
2. Список snapshot: показаны резервная копия в repository, её ID, время создания и каталог.

## 3.

![Skrinshot 3](./03-screenshot.png)

3. Restore natijasi: test.txt fayli tiklandi va uning ichidagi matn orqali tiklash muvaffaqiyati tekshirildi.
3. Результат восстановления: файл test.txt восстановлен, успешность восстановления проверена по его содержимому.

## 4.

![Skrinshot 4](./04-screenshot.png)

4. Append-only himoyasi: snapshot’ni o‘chirish urinishi 403 Forbidden javobi bilan rad etildi.
4. Защита append-only: попытка удалить snapshot отклонена с ответом 403 Forbidden.

# Arxitektura / Архитектура

## O‘zbekcha

### Serverlar

| Server | IP manzili | OS | Vazifasi |
|---|---|---|---|
| SRV-PROD | `10.99.0.10` | Debian | Asosiy server. `/opt/portfolio-data` katalogidagi ma’lumotlar backup qilinadi. |
| SRV-BACKUP | `10.99.0.20` | Ubuntu | Restic REST Server va backup repository joylashgan server. |
| SRV-RECOVERY | Hali belgilanmagan | Debian/Ubuntu | Favqulodda holatda ma’lumotlarni tiklash uchun mo‘ljallangan server. Hali sozlanmagan. |

### Ma’lumotlar oqimi

1. SRV-PROD serveridagi `/opt/portfolio-data` katalogi Restic yordamida zaxiralanadi.
2. Backup nusxasi tarmoq orqali SRV-BACKUP serveridagi `/srv/immutable` repository’siga yuboriladi.
3. Restic REST Server `8000` portida ishlaydi.
4. Repository append-only rejimida sozlangan, bu backup nusxalarini o‘chirishga qarshi qo‘shimcha himoya beradi.
5. Restore testi hozircha SRV-PROD serverining o‘zida bajarilgan. Alohida SRV-RECOVERY serveriga tiklash keyingi bosqichda amalga oshiriladi.

### Sxema

```text
SRV-PROD
10.99.0.10
    |
    | Restic backup
    | HTTP :8000
    v
SRV-BACKUP
10.99.0.20
/srv/immutable
    |
    | Restore (keyingi bosqich)
    v
SRV-RECOVERY
IP hali belgilanmagan

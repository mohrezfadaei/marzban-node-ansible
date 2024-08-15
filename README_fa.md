# انسیبل برای نود مزربان

این مخزن شامل Playbookها و Roleهای Ansible برای نصب Docker، پیکربندی کانتینرهای مارزبان، و مدیریت نودها در یک پنل می‌باشد. این راهنما دستورالعمل‌هایی برای تنظیم یک محیط مجازی Python، نصب Ansible و اجرای Playbookها ارائه می‌دهد.

## زبان

- [انگلیسی](README.md)
- [فارسی](README_fa.md)
- [چینی](README_zh.md)

## پیش‌نیازها

اطمینان حاصل کنید که موارد زیر روی سیستم شما نصب شده باشد:

- Python 3
- pip (مدیریت بسته‌های Python)
- Git (برای کلون کردن این مخزن)
- Docker (برای تست با Docker)

## راه‌اندازی محیط مجازی Python

پیشنهاد می‌شود از یک محیط مجازی Python برای مدیریت dependecyهای خود استفاده کنید. مراحل زیر را برای تنظیم و فعال‌سازی محیط مجازی دنبال کنید:

1. ایجاد محیط مجازی Python:

   ```sh
   python3 -m venv venv
   ```

2. فعال‌سازی محیط مجازی:

   - در لینوکس/مک‌او‌اس:

     ```sh
     source venv/bin/activate
     ```

   - در ویندوز:

     ```sh
     .\venv\Scripts\activate
     ```

3. به‌روزرسانی pip:

   ```sh
   pip install --upgrade pip
   ```

4. نصب Ansible و وابستگی‌های مورد نیاز با استفاده از pip:

```sh
pip install -r requirements.txt
```

## ساختار پروژه

```sh
ansible-playbook-docker-node/
├── ansible.cfg
├── Dockerfile
├── inventory/
│   └── production.yml
├── group_vars/
│   ├── all.yml
│   ├── vault.yml
│   └── README.md
├── host_vars/
├── playbooks/
│   └── site.yml
└── roles/
    ├── create_node_on_panel/
    ├── docker/
    └── marzban/
```

- `ansible.cfg`: فایل پیکربندی Ansible.
- `Dockerfile`: Dockerfile برای راه‌اندازی محیط تست.
- `inventory/`: دایرکتوری حاوی فایل‌های اینونتوری.
- `group_vars/`: دایرکتوری حاوی فایل‌های متغیرهای گروه.
- `host_vars/`: دایرکتوری برای فایل‌های متغیرهای میزبان خاص.
- `playbooks/`: دایرکتوری حاوی Playbookها.
- `roles/`: دایرکتوری حاوی Roleها.

## رمزگذاری داده‌های حساس با Ansible Vault

برای ایمن‌سازی داده‌های حساس مانند گواهی‌نامه‌ها و توکن‌ها، از Ansible Vault استفاده کنید. فایل `vault.yml` در دایرکتوری `group_vars` رمزگذاری شده است. مراحل زیر را برای رمزگذاری/رمزگشایی فایل دنبال کنید:

1. رمزگذاری فایل `vault.yml`:

   ```sh
   ansible-vault encrypt group_vars/vault.yml
   ```

2. رمزگشایی فایل `vault.yml`:

   ```sh
   ansible-vault decrypt group_vars/vault.yml
   ```

## اجرای Playbookها

اطمینان حاصل کنید که فایل‌های اینونتوری و متغیرها به درستی پیکربندی شده‌اند. سپس Playbookها را با استفاده از دستورات زیر اجرا کنید:

### برای محیط تولید

```sh
ansible-playbook -i inventory/production.yml playbooks/site.yml --ask-vault-pass
```

### برای تست با Docker

1. ساخت و اجرای کانتینر Docker:

   ```sh
   docker build -t ansible-test .
   docker run -d --name ansible-test -p 2222:22 ansible-test
   ```

2. اجرای Playbook با اینونتوری تست:

   ```sh
   ansible-playbook -i inventory/test.yml playbooks/site.yml --ask-vault-pass
   ```

3. پاک‌سازی کانتینر Docker پس از تست:

   ```sh
   docker stop ansible-test
   docker rm ansible-test
   ```

## تقدیر و تشکر

مایلیم صمیمانه‌ترین تشکرهای خود را از توسعه‌دهندگان و مشارکت‌کنندگان پروژه [مارزبان](https://github.com/Gozargah/Marzban) ابراز کنیم. مارزبان که توسط Gozargah توسعه داده شده است، راه‌حلی استثنایی برای مدیریت کاربران و خدمات VPN ارائه داده است. رابط کاربری دوستانه و مجموعه ویژگی‌های جامع آن، به طور قابل توجهی مدیریت شبکه‌های VPN را ساده کرده و امنیت و قابلیت اطمینان ارتباطات را تضمین می‌کند.

ما از مشارکت‌های پروژه مارزبان و تعهد جامعه آن سپاسگزاریم. با تشکر از مارزبان برای توانمندسازی سازمان‌ها و افراد برای دستیابی به خدمات VPN ایمن، کارآمد و قابل مدیریت. تلاش‌های شما تأثیر قابل توجهی داشته و ما منتظر رشد و موفقیت مداوم شما هستیم.

## مجوز

این پروژه تحت مجوز Apache است. برای جزئیات بیشتر به فایل [LICENSE](LICENSE) مراجعه کنید.

## مشارکت

مشارکت‌ها خوش‌آمد هستند! لطفاً یک issue باز کنید یا یک pull request با بهبودهای خود ارسال کنید.

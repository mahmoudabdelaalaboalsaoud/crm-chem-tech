# نظام متابعة العملاء

ملف واحد (`index.html`) + قاعدة بيانات Supabase + استضافة Vercel. لا يحتاج تثبيت أو build.

## 1) Supabase
1. أنشئ مشروعاً جديداً على supabase.com.
2. من **SQL Editor** الصق محتوى `supabase.sql` كاملاً واضغط Run.
3. من **Project Settings > API** انسخ `Project URL` و `anon public key`.
4. من **Authentication > Providers > Email** يمكنك إيقاف "Confirm email" لتسهيل التجربة.

## 2) الإعدادات
افتح `index.html` وعدّل أعلى قسم السكريبت:
```js
const SUPABASE_URL = 'https://xxxx.supabase.co';
const SUPABASE_ANON_KEY = '...';
const COUNTRY_CODE = '20'; // كود دولتك لروابط واتساب
```
مفتاح `anon` مصمم ليكون ظاهراً في المتصفح، والحماية الفعلية من سياسات RLS الموجودة في `supabase.sql`. لا تضع `service_role` key أبداً.

## 3) GitHub
ارفع المجلد (`index.html`, `supabase.sql`, `README.md`) على مستودع جديد.

## 4) Vercel
Add New > Project > اختر المستودع > Deploy. (Framework: Other، بدون Build Command).

## ملاحظات
- كل مندوب يسجل بحسابه ويرى عملاءه فقط.
- لو تريد مدير يرى عملاء الفريق كله، أخبرني وأضيف دوراً وسياسات للمدير.

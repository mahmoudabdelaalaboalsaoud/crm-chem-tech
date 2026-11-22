-- شغّل هذا الملف كاملاً في Supabase > SQL Editor
create table customers (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  name text not null,
  company text,
  phone text,
  city text,
  status text not null default 'جديد',
  next_follow_up date,
  notes text,
  created_at timestamptz not null default now()
);

create table interactions (
  id uuid primary key default gen_random_uuid(),
  customer_id uuid not null references customers(id) on delete cascade,
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  type text not null default 'مكالمة',
  note text,
  created_at timestamptz not null default now()
);

create index on customers (user_id, next_follow_up);
create index on interactions (customer_id, created_at desc);

alter table customers enable row level security;
alter table interactions enable row level security;

-- كل مندوب يرى بياناته فقط
create policy "own customers" on customers for all
  using (user_id = auth.uid()) with check (user_id = auth.uid());
create policy "own interactions" on interactions for all
  using (user_id = auth.uid()) with check (user_id = auth.uid());

create table if not exists public.arduino_experiments (
  id uuid primary key default gen_random_uuid(),
  title text not null check (char_length(title) between 2 and 70),
  author text not null default '익명' check (char_length(author) <= 32),
  description text not null default '' check (char_length(description) <= 280),
  board text not null check (board in ('uno','mega')),
  circuit jsonb not null check (jsonb_typeof(circuit) = 'object' and pg_column_size(circuit) <= 65536),
  code text not null check (char_length(code) <= 16000),
  created_at timestamptz not null default now()
);
alter table public.arduino_experiments enable row level security;
grant select, insert on public.arduino_experiments to anon, authenticated;
drop policy if exists "Public can read Arduino experiments" on public.arduino_experiments;
create policy "Public can read Arduino experiments" on public.arduino_experiments for select to anon, authenticated using (true);
drop policy if exists "Public can share Arduino experiments" on public.arduino_experiments;
create policy "Public can share Arduino experiments" on public.arduino_experiments for insert to anon, authenticated with check (
  char_length(title) between 2 and 70
  and char_length(author) <= 32
  and char_length(description) <= 280
  and board in ('uno','mega')
  and jsonb_typeof(circuit) = 'object'
  and pg_column_size(circuit) <= 65536
  and char_length(code) <= 16000
);


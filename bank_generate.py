import random

def gererate_id(used_ids):
    while True:
        new_id = random.randint(1, 999)
        if new_id not in used_ids:
            used_ids.add(new_id)
            return new_id

def generate_name(used_bank_names, bank_names)
    while True:
        bank_name = random.choice(bank_names).strip()
        if bank_name not in used_bank_names:
            used_bank_names.add(bank_name)
            return bank_name

with open("banks.txt", "r") as file:
    bank_names = file.readlines()

used_ids = set()
used_bank_names = set()

num_records = 151

for _ in range(num_records):
    random_id = generate_id(used_ids)
    random_bank_name = generate_name(used_bank_names, bank_names)
    sql_insert = f"INSERT INTO bank (number, name) VALUES ({random_id}, '{random_bank_name}'::VARCHAR(50));"
    print(sql_insert)
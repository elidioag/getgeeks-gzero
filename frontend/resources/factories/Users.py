from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def factory_user(target):

    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'pwd123'            
        },
        'wrong_email': {
            'name': 'Test',
            'lastname': fake.last_name(),
            'email': 'Test&gmail.com',
            'password': 'pwd123'           
        },
        'login': {
            'name': 'Test',
            'lastname': 'Login',
            'email': 'test@email.com',
            'password': 'pwd123'            
        },
        'be_geek': {
            'name': 'Kim',
            'lastname': 'Dotcom',
            'email': 'kim@dot.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Descrição Geek Com 80 Caracteres Por que existe uma validação na aplicação de exemplo feita pelo pessoal do QANinja',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '100'
            }            
        },
        'attempt_be_geek': {
            'name': 'Dio',
            'lastname': 'Linux',
            'email': 'dio@linux.com',
            'password': 'pwd123',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Formato seu PC com uma descrição muito longa e ela nunca vai acabar por isso estou escrevendo todas essas coisas pra ver se eu consigo cansar vc de ler e por isso você acabará contratando meus serviços',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '150'
            }            
        }                               
    }

    return data[target]
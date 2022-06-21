from faker import Faker
fake = Faker()

import bcrypt

def get_hashed_pass(password):
    hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
    return hashed

def users_to_insert_db():
    return [
        factory_user('login'),
        factory_user('be_geek'),
        factory_user('attempt_be_geek'),
        factory_user('search_alien'),
        factory_user('search_common'),
        factory_user('searcher')        
    ]    

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
        },
        'searcher': {
            'name': 'Johnny',
            'lastname': 'Lawrence',
            'email': 'johnny@cobrakai.com',
            'password': 'pwd123'
        },
        'search_alien': {
            'name': 'Dok',
            'lastname': 'Ock',
            'email': 'dok@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999991001',
                'desc': 'Faço conserto de qualquer impressora. Matricial a fita, Matricial a fita colorida, a laser, a jato de tinta e também impressora 3D.',
                'printer_repair': 'Sim',
                'work': 'Presencial',
                'cost': '250'
            }
        },
        'search_common': {
            'name': 'Peter',
            'lastname': 'Parker',
            'email': 'parker@oscorp.com',
            'password': 'pwd123',
            'geek_profile': {
                'whatsapp': '21999991002',
                'desc': 'Faço instalação de distribuições Linux no seu computador PC X86 ou X64 com processadores Intel ou AMD. Pode ser Linux Debian, Ubuntu, Mint, Fedora etc...',
                'printer_repair': 'Não',
                'work': 'Remoto',
                'cost': '200' 
            }
        }                                     
    }

    return data[target]
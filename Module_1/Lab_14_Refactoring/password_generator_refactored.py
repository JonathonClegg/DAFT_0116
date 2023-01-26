# -*- coding: utf-8 -*-

import random
import re

def generate_password():
  character_number = [chr(i) for i in range(48,57)]
  character_symbol = [chr(i) for i in range(33,47)]
  character_lower = [chr(i) for i in range(97,122)]
  character_upper = [chr(i) for i in range(65,90)]
  lists = []
  lists.append(character_number)
  lists.append(character_symbol)
  lists.append(character_lower)
  lists.append(character_upper)

  password = []
  n = 20

  for i in range(n):
    for j in range(4):
      password.append(random.sample(lists[j],1))
  password_str = ''.join(random.sample(password_str,len(''.join([i[0] for i in password]))))
  return ("Your Password is: %s"%password_str)

username = str(input("Your email is: "))
pattern = "[\w+\.-]+@[\w+]+\.[\w+]+"
 
while True:
  
  if re.findall(pattern, username):
    print(generate_password())
    break
  else:
    print("Please input a proper email address:")
    type2 = str(input("Your email is: "))
    username = type2
    generate_password()


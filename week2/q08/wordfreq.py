words = open("words.txt", encoding="utf-8").read().split()
unique = list(dict().fromkeys(words))
print("count=", len(unique))

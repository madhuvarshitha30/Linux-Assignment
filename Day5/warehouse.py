categories=[]
products=[]
stocks=[]
 
num_categories=3
products=2
inventory=[]
 
for i in range(num_categories):
    cat = input("\nEnter category name: )
    category.append(cat)
    product=[]
    stocks=[]
    print("Enter the product available")
    for j in range(products):
        item=input("Enter product name:")
        stock=int(input("Enter stock: "))
        product.append(item)
        stocks.append(stock)

def check_df(lista):
    count = 0
    print(f"Shape is: {lista.shape},\n\nThe names for the columns:\n{lista.columns}")

    
    row_lenght = lista['Date'].value_counts().sum()
    print(f"The following information is based on the dataframe row's lenght: {row_lenght}\n")
    for x in lista:
        count += 1
        pre_percentage = round(lista[x].value_counts().sum()/len(lista[x]),2)
        not_na = lista[x].value_counts().sum()
        print(f'#{count}. Column {x} has {not_na} rows that are not NA and {(1-pre_percentage)*100}% of missing data.')

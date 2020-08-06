echo "Hello World"
mkdir new_dir
rmdir new_dir

cp lorem/sed.txt lorem-copy/
cp lorem/at.txt|lorem/lorem.txt lorem-copy/
cp lorem/lorem.txt lorem-copy/ | cp lorem/at.txt lorem-copy/

head -3 lorem/lorem.txt
tail -3 lorem/lorem.txt

echo "homo homini lupus" >> lorem-copy/sed.txt

tail -3 lorem-copy/sed.txt

sed -i 's/et/ET/g' lorem-copy/sed.txt

who | cut -d' ' -f1 | sort | uniq

echo "who no es reconocido por esto :("

pwd

cd lorem
ls *.txt
wc -l sed.txt
cd ..
find . -iname "*lorem*" | wc -l

cd lorem
grep -o -i et at.txt
grep -o -i et at.txt | wc -l
cd ..
grep -o et * | wc -l

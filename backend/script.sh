#nazionale
cd ../covid19-italia/nazionale
rm output/*
python3 SIR-R0.py
cp -R output/*.csv ../R/fit_modelli/

#macroregioni
cd ../macroregioni
rm output/*
python3 macroregioni.py
cp -R output/*.csv ../R/fit_modelli/

# regioni
cd ../regioni
rm output/*
python3 R0_map.py
cp -R output/*.csv ../R/fit_modelli/
cp -R output/*.geojson ../R/fit_modelli/

# R
cd ../R
rm export/*
Rscript main.R
zip -r export/export.zip export
aws s3 cp export/ s3://covstatit/ --recursive
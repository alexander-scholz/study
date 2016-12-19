# 1.)
text_data = read.table('exercise9/MSc_Bioinf/B9A4_mySnps.txt', header = F)
bim_data = data.table::fread('exercise9/MSc_Bioinf/B9A4_1KG_PCA.bim')

table(is.element(text_data$V1,bim_data$V2))

filt = is.element(text_data$V1,bim_data$V2)
dummy = as.character(text_data$V1[filt])
write.table(dummy, file="exercise9/MSc_Bioinf/filt_text_data.txt", quote = F, row.names = F, col.names = F)

# 2.)
fam.data = read.table('exercise9/MSc_Bioinf/B9A4_1KG_PCA.fam', stringsAsFactors = F, sep = ' ')
dim(fam.data) # 1092    6

table(substr(fam.data$V2, 1, 3))
afr_data = fam.data[substr(fam.data$V2, 1, 3) == 'AFR', ]
asn_data = fam.data[substr(fam.data$V2, 1, 3) == 'ASN', ]
asn_data = asn_data[1:nrow(afr_data),]
eur_data = fam.data[substr(fam.data$V2, 1, 3) == 'EUR', ]
eur_data = eur_data[1:nrow(afr_data),]

all_ethnie_data = rbind(afr_data, asn_data, eur_data)
write.table(all_ethnie_data, 'exercise9/MSc_Bioinf/ethnie_filter_data.txt', quote = F, row.names = F, col.names = F)

# 3.)
# using plink
# install on debian-based unix: apt-get install plink
# installs binary to /usr/lib/plink/plink
system("plink --bfile exercise9/MSc_Bioinf/B9A4_1KG_PCA --extract exercise9/MSc_Bioinf/B9A4_mySnps.txt --keep exercise9/MSc_Bioinf/ethnie_filter_data.txt --indep-pairwphase 50 5 0.2 --out 3_pruned_data")
system('plink --bfile exercise9/MSc_Bioinf/B9A4_1KG_PCA --extract 3_prunde_data.prune.in --keep exercise9/MSc_Bioinf/ethnie_filter_data.txt --make-bed --out 4_pruned_data')
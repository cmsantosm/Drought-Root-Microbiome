# Set workind directory and load libraries 
library(DESeq2)

# Load data
otu <- readRDS("../Data/otu_filt.RDS")
map <- readRDS("../Data/map.RDS")

# Subset and format
row.names(map) <- map$SampleID
otu <- otu[,match(map$SampleID, colnames(otu))]

# Generate DESeq object

dds <- DESeqDataSetFromMatrix(countData = otu,
                              colData = map,
                              design = ~ 1)

dds <- DESeq(dds)

vsd.blind <- varianceStabilizingTransformation(dds, blind = TRUE)
norm.blind <- assay(vsd.blind)
norm.count <- counts(dds, normalized = TRUE)

saveRDS(norm.blind, "../Data/otu_vsd_blind.RDS")
saveRDS(norm.count, "../Data/otu_DESeqnorm.RDS")
# Основные пакеты
pip3 install scanpy[leiden] anndata2ri scikit-misc scvi-tools
# Пакеты с батч-коррекцией (потребуются на занятии по батч-коррекции и дальше):
pip3 install bbknn harmonypy scanorama
# Пакеты для работы с мультимодальными данными:
pip3 install muon mofapy2
# Пакеты для Trajectory inference и RNA velocity:
pip3 install scvelo scFates

## R:

# Основные пакеты 
apt-get install libgmp3-dev libcairo2-dev libharfbuzz-dev libfribidi-dev libudunits2-dev
Rscript -e 'install.packages(c("Seurat", "BiocManager"), repos="https://cloud.r-project.org")'
Rscript -e 'BiocManager::install("SingleCellExperiment", "DropletUtils")'

# Пакеты для батч-коррекции:
Rscript -e 'BiocManager::install("ComplexHeatmap")'
Rscript -e 'install.packages(c("conos", "pagoda2"), repos="https://cloud.r-project.org")'

# Пакеты для дифференциальной экспрессии:
Rscript -e 'BiocManager::install(с("DESeq2", "edgeR", "tximport"))'

# Пакеты с геномными аннотациями:
Rscript -e 'BiocManager::install("EnsDb.Mmusculus.v79", "org.Mm.eg.db", "EnsDb.Hsapiens.v86", "org.Hs.eg.db")'

# Пакеты для Trajectory inference:
Rscript -e 'BiocManager::install(с("kstreet13/slingshot", "BiocGenerics", "DelayedArray", "DelayedMatrixStats"))'
Rscript -e 'BiocManager::install(с("limma", "S4Vectors", "SingleCellExperiment", "SummarizedExperiment"))'
Rscript -e 'BiocManager::install(с("batchelor", "Matrix.utils", "HDF5Array", "terra", "ggrastr", "lme4"))'
Rscript -e 'install.packages(c("devtools"), repos="https://cloud.r-project.org")'
Rscript -e 'devtools::install_github("cole-trapnell-lab/monocle3")'

# Загрузка необходимых пакетов для R:
apt-get install libgmp3-dev libcairo2-dev libharfbuzz-dev libfribidi-dev libudunits2-dev

# import anndata2ri
# anndata2ri.activate()
# %load_ext rpy2.ipython
# %R .libPaths("usr/local/lib/R/site-library/")

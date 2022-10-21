'''
Задание:
Сделайте несколько вспомогательных функций, которые вам позднее пригодятся:
'''

import numpy as np
import scanpy as sc
import rpy2.robjects as ro
import anndata2ri
anndata2ri.activate()

'''
1- Разбиение одного объекта AnnData на список других, соответствующих каждому индивидуальному батчу;
'''

def split_by_batch(adata, meta_data):
  '''
  func to split anndata object based on meta data in anndata.obs
  inputs:
    adata: Anndata object
    meta_data: name of column in adata.obs to split by it
  outputs:
    res_dict: {meta_name1: adata, meta_name2: adata, ... , meta_nameN: adata} 
  '''
  res_dict = {}
  for group in adata.obs[meta_data].unique():
    
    res_dict[group] = adata[adata.obs[meta_data] == group, :]
  return res_dict


'''
2- Создание нового объекта со случайными N клетками и M генами из изначального;
'''

def random_sample_from_adata(adata, n, m, random_state = 42):
  '''
  func to make a subsample from adata with random N cells and m genes 
  inputs:
    adata: Anndata object
    n: int, number of random cells
    m: int, number of random genes
  outputs:
    sub_adata
  '''
  R = np.random.RandomState(random_state)
  sub_adata = adata[
    R.randint(0, adata.shape[0], n),
    R.randint(0, adata.shape[0], m)
  ]
  return sub_adata

'''
3- Сохранение вашего AnnData-объекта как Seurat-объекта в формате .rds.
'''
def save_adata_as_rds(adata, save_path):
  '''
  func to save adata object as .rds file 
  inputs:
    adata: Anndata object
    save_path: str, <path_to_save>/<file_name>.rds
  outputs:
    - 
  '''
  ro.globalenv["adata"] = adata
  ro.globalenv["save_path"] = save_path
  ro.r('saveRDS(as.Seurat(adata), file = save_path)')
  

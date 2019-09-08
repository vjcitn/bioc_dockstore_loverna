workflow rnaseqGene {
  call runR
}

task runR {
 File workflow_script = "https://raw.githubusercontent.com/vjcitn/bioc_dockstore_loverna/master/rnaseqGene_bioc3.8.R"
 command {
  pip install gsutil
  gsutil cp gs://bioc_pkgs_aug_2019/loverna_packrat_pkgs_bioc3.8.zip .
  unzip loverna_packrat_pkgs_bioc3.8.zip
  Rscript ${workflow_script}
  }
 runtime {
  docker: "bioconductor/bioconductor_full:RELEASE_3_8"
 }
}

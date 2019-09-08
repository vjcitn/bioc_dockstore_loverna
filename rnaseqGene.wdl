workflow rnaseqGene {
  call runR
}

task runR {
 File workflow_script = "https://raw.githubusercontent.com/vjcitn/bioc_dockstore_loverna/master/rnaseqGene.R"
 command {
  pip install gsutil
  gsutil cp gs://bioc_pkgs_aug_2019/loverna_packrat_pkgs.zip .
  unzip loverna_packrat_pkgs.zip
  Rscript ${workflow_script}
  }
 runtime {
  docker: "bioconductor/bioconductor_full:devel"
 }
}

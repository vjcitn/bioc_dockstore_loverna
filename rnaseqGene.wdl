workflow rnaseqGene {
  call runR
  meta {
        author: "Mike Love/VJ Carey"
        email: "stvjc@channing.harvard.edu"
        description: "Dockstore deployment of a Bioconductor 3.10 workflow."
    }
}

task runR {
 #File workflow_script = "https://raw.githubusercontent.com/vjcitn/bioc_dockstore_loverna/master/rnaseqGene.R"
 File workflow_script = "gs://vjc_scripts/rnaseqGene.R"
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

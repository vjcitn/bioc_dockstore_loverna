workflow rnaseqGene {
  call runR
  meta {
        author: "Mike Love/VJ Carey"
        email: "stvjc@channing.harvard.edu"
        description: "Dockstore deployment of a Bioconductor 3.8 workflow."
    }   
}

task runR {
# for terra following must have a gs protocol
#File workflow_script = "https://raw.githubusercontent.com/vjcitn/bioc_dockstore_loverna/master/rnaseqGene_bioc3.8.R"
 File workflow_script = "gs://vjc_scripts/rnaseqGene_bioc3.8.R"
 command {
  pip install gsutil --upgrade
  gsutil cp gs://bioc_pkgs_aug_2019/loverna_packrat_pkgs_bioc3.8.zip .
  ls
  unzip loverna_packrat_pkgs_bioc3.8.zip
  Rscript ${workflow_script}
  }
 runtime {
  docker: "bioconductor/bioconductor_full:RELEASE_3_8"
 }
}

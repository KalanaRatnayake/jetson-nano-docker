#---------------------------------------------------------------------------------------------------------------------------
#----
#----   Start base image
#----
#---------------------------------------------------------------------------------------------------------------------------

FROM ghcr.io/kalanaratnayake/foxy-base:r32.7.1 as base

WORKDIR /

######################################################################################
##                           Install pip
######################################################################################

RUN apt-get update -y
RUN apt-get install  -y --no-install-recommends python3-pip

######################################################################################
##                           Install pytorch
######################################################################################
    
RUN pip3 install --upgrade --no-cache-dir   torch==1.12.1+cu102 \
                                            torchvision==0.13.1+cu102 \
                                            torchaudio==0.12.1 \
                                            --extra-index-url https://download.pytorch.org/whl/cu102
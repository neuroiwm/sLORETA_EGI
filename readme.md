# readme

PGMs to apply sLORETA to EEG datasets from EGI netstation.

## Usage

This PGM assumes EEG dataset as a 3D matrix [time ch trl]
Regardless the analysis is for evoked or induced activity, prepare the preprocessed dataset to match above axes.

Reject bad channels (e.g. measured with high impedance) before using this script
If your datasets were recorded with EGI netstation, you can generate channel list using generateChlist.m





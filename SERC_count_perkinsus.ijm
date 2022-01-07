/*
SERC_count_perkinsus.ijm
This FIJI/ImageJ macro is optimized for counting samples of RFTM incubated, NaOH digested, Lugol’s stained Perkinsus samples that have been imaged with high resolution color micrographs. Dimensional parameters are in “pixel” units
 
Author: Teresa Vaillancourt, Ph.D. svmehitabel at gmail dot com
December 2021
License: BSD3
 
 Copyright 2021 Teresa Vaillancourt
 
 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
 3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

*/

FileName = getInfo("image.filename");
run("Duplicate...", "title=Copy1");
run("Duplicate...", "title=Copy2");
selectWindow(FileName);
run("Split Channels");
close();
close();
run("Auto Local Threshold", "method=Phansalkar radius=100 parameter_1=0 parameter_2=0 white");
run("Gaussian Blur...", "sigma=3");
run("Convert to Mask");
run("Watershed");
run("Set Measurements...", "area perimeter fit shape display redirect=None decimal=2");
run("Analyze Particles...", "size=50-1000000 circularity=0.85-1.00 show=[Overlay Masks] display exclude include summarize");
run("Labels...", "color=black font=12 show bold");
run("Magenta");
run("Flatten");
run("Copy");
close();
close();
selectWindow("Copy2");
run("Select All");
setBackgroundColor(0,0,0);
run("Clear", "slice");
run("Paste Control...");
run("Paste");
selectWindow("Copy1");
run("Images to Stack", "name=Stack title=[] use");
run("Make Montage...", "columns=2 rows=1 scale=1");
rename(FileName+"Montage");


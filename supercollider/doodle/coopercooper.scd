(({var beat1=[2,3,2,3,2,3,1,1,3,2,2,1,2,2,1,2];var beat2=[1,2,2];var beat3=[1,1,
1,2];var note1=43;var note2=note1;var chord1=[0,-4,3,4];var chord2=[0,3,7,12,14,
15,19];var bass1, synth1, noise1, mix;var trigger1=TDuty.kr(Dseq([16],inf)); var
trigger2=TDuty.kr([Dseq(beat1,inf)/8,Dseq(beat1,inf)/8]);var  trigger3=TDuty.kr(
Dseq(beat3/8,inf));var trigger4=TDuty.kr(Drand(beat3/8,inf));var seq1=Demand.kr(
trigger1,0,Dseq(note1+chord1,inf));var seq2=Demand.kr(trigger2, 0, Drand( note2+
chord2,inf));var filterfreq=seq1.midicps+Demand.kr(trigger3, 0, Dseq([MouseX.kr(
400, 5000),  150, 700,150 ], inf));bass1=(LFTri.ar([(seq1 + 12).midicps,(seq1+12
).midicps+0.1])*0.5+ LFPulse.ar([(seq1-12).midicps,(seq1-12).midicps-0.1])*0.5);
bass1=RLPFD.ar(in:bass1,ffreq:LinExp.kr(SinOsc.kr(filterfreq+2,1+0.5 * pi),-1,1,
dstlo: (filterfreq+82), dsthi: (filterfreq+202)), res:MouseY.kr(0.1, 0.5), dist:
MouseX.kr(6,8););synth1=LFPulse.ar(seq2.midicps,width:0.5); synth1=(RLPFD.ar(in:
synth1,ffreq:MouseX.kr(1000,4500), res:0.3,dist:3)*EnvGen.kr(Env.asr(attackTime:
0.04, releaseTime: 0.4), trigger2)); noise1=WhiteNoise.ar() * EnvGen.kr(Env.asr(
attackTime:0.04, releaseTime: MouseX.kr(0.0,0.4)+MouseY.kr(0.0,0.4)), trigger4);
mix=Mix.ar([(noise1*MouseY.kr(0.01, 0.2)),(bass1*0.9),(synth1*6),(PitchShift.ar(
in:synth1*5 +bass1*2,windowSize:0.5,pitchRatio:2,pitchDispersion:MouseX.kr(0.01,
0.05), timeDispersion:MouseY.kr(5,10)) * MouseX.kr(0, 1)) * 0.35]).tanh;}.play))

function out = model
%
% Supporting_information_of_Code.m
%
% Model exported on Dec 3 2024, 12:54 by COMSOL 6.2.0.290.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('C:\Users\lenovo\Desktop');

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);
model.component('comp1').geom('geom1').axisymmetric(true);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').physics.create('cd', 'SecondaryCurrentDistribution', 'geom1');

model.study.create('std1');
model.study('std1').create('time', 'Transient');
model.study('std1').feature('time').setSolveFor('/physics/cd', true);

model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('size', [2 10]);
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').lengthUnit('nm');
model.component('comp1').geom('geom1').lengthUnit('mm');
model.component('comp1').geom('geom1').feature.duplicate('r2', 'r1');
model.component('comp1').geom('geom1').feature('r2').set('size', [1 10]);
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').feature('r2').set('pos', [2 0]);
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').feature.duplicate('r3', 'r1');
model.component('comp1').geom('geom1').feature('r3').set('pos', [3 0]);
model.component('comp1').geom('geom1').run('r3');
model.component('comp1').geom('geom1').run;

model.component('comp1').material.create('mat1', 'Common');
model.component('comp1').material('mat1').propertyGroup('def').func.create('int1', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup('def').func.create('int2', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup.create('ElectrodePotential', 'Equilibrium potential');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func.create('int1', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func.create('int2', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup.create('OperationalSOC', 'Operational electrode state of charge');
model.component('comp1').material('mat1').propertyGroup.create('ic', 'Intercalation strain');
model.component('comp1').material('mat1').propertyGroup('ic').func.create('int1', 'Interpolation');
model.component('comp1').material('mat1').propertyGroup.create('EquilibriumConcentration', 'Equilibrium concentration');
model.component('comp1').material('mat1').label('Graphite, LixC6 MCMB (Negative, Li-ion Battery)');
model.component('comp1').material('mat1').propertyGroup('def').label('Basic');
model.component('comp1').material('mat1').propertyGroup('def').func('int1').label('Interpolation 1');
model.component('comp1').material('mat1').propertyGroup('def').func('int1').set('funcname', 'E_int');
model.component('comp1').material('mat1').propertyGroup('def').func('int1').set('table', {'0' '32.47'; '0.333' '28.56'; '0.5' '58.06'; '1' '108.67'});
model.component('comp1').material('mat1').propertyGroup('def').func('int1').set('fununit', {'GPa'});
model.component('comp1').material('mat1').propertyGroup('def').func('int1').set('argunit', {'1'});
model.component('comp1').material('mat1').propertyGroup('def').func('int2').label('Interpolation 2');
model.component('comp1').material('mat1').propertyGroup('def').func('int2').set('funcname', 'nu_int');
model.component('comp1').material('mat1').propertyGroup('def').func('int2').set('table', {'0' '0.32'; '0.333' '0.39'; '0.5' '0.34'; '1' '0.24'});
model.component('comp1').material('mat1').propertyGroup('def').func('int2').set('fununit', {''});
model.component('comp1').material('mat1').propertyGroup('def').set('youngsmodulus', '');
model.component('comp1').material('mat1').propertyGroup('def').set('poissonsratio', '');
model.component('comp1').material('mat1').propertyGroup('def').set('youngsmodulus', 'E_int(c/csmax)');
model.component('comp1').material('mat1').propertyGroup('def').set('INFO_PREFIX:youngsmodulus', 'Yue Qi et al 2010 J. Electrochem. Soc. 157 A558');
model.component('comp1').material('mat1').propertyGroup('def').set('poissonsratio', 'nu_int(c/csmax)');
model.component('comp1').material('mat1').propertyGroup('def').set('INFO_PREFIX:poissonsratio', 'Yue Qi et al 2010 J. Electrochem. Soc. 157 A558');
model.component('comp1').material('mat1').propertyGroup('def').set('electricconductivity', {'100[S/m]' '0' '0' '0' '100[S/m]' '0' '0' '0' '100[S/m]'});
model.component('comp1').material('mat1').propertyGroup('def').set('INFO_PREFIX:electricconductivity', ['V. Srinivasan, and J. Newman, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Design and Optimization of a Natural Graphite/Iron Phosphate Lithium Ion Cell,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Electrochem. Soc., vol. 151, p. 1530, 2004.']);
model.component('comp1').material('mat1').propertyGroup('def').set('diffusion', {'1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]'});
model.component('comp1').material('mat1').propertyGroup('def').set('INFO_PREFIX:diffusion', ['K. Kumaresan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermal Model for a Li-Ion Cell,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Electrochem. Soc., vol. 155, p. A164, 2008.']);
model.component('comp1').material('mat1').propertyGroup('def').set('thermalconductivity', {'1[W/(m*K)]' '0' '0' '0' '1[W/(m*K)]' '0' '0' '0' '1[W/(m*K)]'});
model.component('comp1').material('mat1').propertyGroup('def').set('INFO_PREFIX:thermalconductivity', 'S. Chen, C. Wan, and Y. Wang, J. Power Sources, 140, 111 (2005).');
model.component('comp1').material('mat1').propertyGroup('def').set('heatcapacity', '750[J/(kg*K)]');
model.component('comp1').material('mat1').propertyGroup('def').set('INFO_PREFIX:heatcapacity', 'SI Chemical Data, John Wiley & Sons, 1994');
model.component('comp1').material('mat1').propertyGroup('def').set('density', '2300[kg/m^3]');
model.component('comp1').material('mat1').propertyGroup('def').set('INFO_PREFIX:density', 'SI Chemical Data, John Wiley & Sons, 1994');
model.component('comp1').material('mat1').propertyGroup('def').set('csmax', '31507[mol/m^3]');
model.component('comp1').material('mat1').propertyGroup('def').descr('csmax', '');
model.component('comp1').material('mat1').propertyGroup('def').set('T_ref', '318[K]');
model.component('comp1').material('mat1').propertyGroup('def').descr('T_ref', '');
model.component('comp1').material('mat1').propertyGroup('def').set('T2', 'min(393.15,max(T,223.15))');
model.component('comp1').material('mat1').propertyGroup('def').descr('T2', '');
model.component('comp1').material('mat1').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat1').propertyGroup('def').addInput('concentration');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').label('Equilibrium potential');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int1').label('Interpolation 1');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int1').set('funcname', 'Eeq_int1');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int1').set('table', {'0' '2.781186612';  ...
'0.01' '1.520893224';  ...
'0.02' '0.893922607';  ...
'0.03' '0.581284406';  ...
'0.04' '0.42452844';  ...
'0.05' '0.344895805';  ...
'0.06' '0.303146342';  ...
'0.07' '0.279578072';  ...
'0.08' '0.264093089';  ...
'0.09' '0.251347845';  ...
'0.1' '0.238588379';  ...
'0.11' '0.224803164';  ...
'0.12' '0.210294358';  ...
'0.13' '0.196408586';  ...
'0.14' '0.184624188';  ...
'0.15' '0.175188157';  ...
'0.16' '0.167373311';  ...
'0.17' '0.160452107';  ...
'0.18' '0.154025412';  ...
'0.19' '0.147948522';  ...
'0.2' '0.142214997';  ...
'0.21' '0.13688271';  ...
'0.22' '0.132033114';  ...
'0.23' '0.127747573';  ...
'0.24' '0.124091616';  ...
'0.25' '0.121103387';  ...
'0.26' '0.11878567';  ...
'0.27' '0.117102317';  ...
'0.28' '0.115980205';  ...
'0.29' '0.115317054';  ...
'0.3' '0.114993965';  ...
'0.31' '0.114890105';  ...
'0.32' '0.114886278';  ...
'0.33' '0.114884619';  ...
'0.34' '0.114873068';  ...
'0.35' '0.114824904';  ...
'0.36' '0.114644725';  ...
'0.37' '0.114372614';  ...
'0.38' '0.114017954';  ...
'0.39' '0.11359371';  ...
'0.4' '0.11311133';  ...
'0.41' '0.112575849';  ...
'0.42' '0.111980245';  ...
'0.43' '0.111297682';  ...
'0.44' '0.110470149';  ...
'0.45' '0.109393081';  ...
'0.46' '0.107900592';  ...
'0.47' '0.10576964';  ...
'0.48' '0.102783317';  ...
'0.49' '0.09889031';  ...
'0.5' '0.094391564';  ...
'0.51' '0.089921069';  ...
'0.52' '0.086112415';  ...
'0.53' '0.083265315';  ...
'0.54' '0.081326247';  ...
'0.55' '0.080074892';  ...
'0.56' '0.07928329';  ...
'0.57' '0.078778765';  ...
'0.58' '0.078447703';  ...
'0.59' '0.078220432';  ...
'0.6' '0.078055641';  ...
'0.61' '0.077929111';  ...
'0.62' '0.077826563';  ...
'0.63' '0.077739397';  ...
'0.64' '0.077662227';  ...
'0.65' '0.077591472';  ...
'0.66' '0.077524557';  ...
'0.67' '0.077459463';  ...
'0.68' '0.077394455';  ...
'0.69' '0.077327934';  ...
'0.7' '0.077258337';  ...
'0.71' '0.077184077';  ...
'0.72' '0.077103499';  ...
'0.73' '0.077014851';  ...
'0.74' '0.076916258';  ...
'0.75' '0.07680571';  ...
'0.76' '0.07668104';  ...
'0.77' '0.07653992';  ...
'0.78' '0.076379839';  ...
'0.79' '0.076198086';  ...
'0.8' '0.075991699';  ...
'0.81' '0.075757371';  ...
'0.82' '0.075491288';  ...
'0.83' '0.075188813';  ...
'0.84' '0.07484398';  ...
'0.85' '0.074448647';  ...
'0.86' '0.07399118';  ...
'0.87' '0.073454466';  ...
'0.88' '0.072812991';  ...
'0.89' '0.072028722';  ...
'0.9' '0.071045433';  ...
'0.91' '0.069780996';  ...
'0.92' '0.068116222';  ...
'0.93' '0.065874599';  ...
'0.94' '0.062770873';  ...
'0.95' '0.058253898';  ...
'0.96' '0.051075794';  ...
'0.97' '0.038790069';  ...
'0.98' '0.020172191'});
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int1').set('extrap', 'linear');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int1').set('fununit', {'V'});
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int1').set('argunit', {''});
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int1').set('defineinv', true);
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int1').set('funcinvname', 'Eeq_inv');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int2').label('Interpolation 2');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int2').set('funcname', 'dEeqdT_int1');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int2').set('table', {'0' '3.0e-4';  ...
'0.17' '0';  ...
'0.24' '-6e-5';  ...
'0.28' '-1.6e-4';  ...
'0.5' '-1.6e-4';  ...
'0.54' '-9e-5';  ...
'0.71' '-9e-5';  ...
'0.85' '-1.0e-4';  ...
'1.0' '-1.2e-4'});
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int2').set('fununit', {'V/K'});
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').func('int2').set('argunit', {''});
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').set('Eeq', 'Eeq_int1(soc)+dEeqdT_int1(soc)*(T-298[K])');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').set('INFO_PREFIX:Eeq', ['D. P Karthikeyan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermodynamic model development for lithium intercalation electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources, vol. 185, p. 1398, 2008.']);
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').set('dEeqdT', 'dEeqdT_int1(soc)');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').set('INFO_PREFIX:dEeqdT', ['K. E. Thomas, and J. Newman, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Heats of mixing and of entropy in porous insertion electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources., vol. 119-121, p. 844, 2003.']);
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').set('cEeqref', 'def.csmax');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').set('soc', 'c/cEeqref');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').descr('soc', '');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').addInput('concentration');
model.component('comp1').material('mat1').propertyGroup('ElectrodePotential').addInput('temperature');
model.component('comp1').material('mat1').propertyGroup('OperationalSOC').label('Operational electrode state of charge');
model.component('comp1').material('mat1').propertyGroup('OperationalSOC').set('socmax', 'elpot.Eeq_inv(E_min)');
model.component('comp1').material('mat1').propertyGroup('OperationalSOC').set('socmin', 'elpot.Eeq_inv(E_max)');
model.component('comp1').material('mat1').propertyGroup('OperationalSOC').set('E_max', '1[V]');
model.component('comp1').material('mat1').propertyGroup('OperationalSOC').set('E_min', '0.075[V]');
model.component('comp1').material('mat1').propertyGroup('ic').label('Intercalation strain');
model.component('comp1').material('mat1').propertyGroup('ic').func('int1').label('Interpolation 1');
model.component('comp1').material('mat1').propertyGroup('ic').func('int1').set('funcname', 'dVOLdSOL');
model.component('comp1').material('mat1').propertyGroup('ic').func('int1').set('table', {'0' '0';  ...
'0.006802721088435382' '0.12500000000000178';  ...
'0.06316812439261421' '1.2736486486486491';  ...
'0.11175898931000966' '2.523648648648649';  ...
'0.17978620019436342' '3.5709459459459474';  ...
'0.2400388726919339' '4.449324324324325';  ...
'0.2905733722060252' '5.192567567567568';  ...
'0.3566569484936831' '5.66554054054054';  ...
'0.4188532555879494' '5.969594594594595';  ...
'0.48104956268221566' '6.10472972972973';  ...
'0.5432458697764819' '6.173648648648647';  ...
'0.58600583090379' '6.306081081081081';  ...
'0.6112730806608356' '7.726351351351352';  ...
'0.6443148688046647' '8.570945945945946';  ...
'0.694849368318756' '9.449324324324323';  ...
'0.7414965986394557' '10.29391891891892';  ...
'0.7764820213799805' '10.902027027027025';  ...
'0.8231292517006802' '11.543918918918918';  ...
'0.8542274052478133' '12.152027027027026';  ...
'0.8833819241982507' '12.827702702702702';  ...
'0.9183673469387755' '12.996621621621621';  ...
'0.9494655004859086' '13.16554054054054'});
model.component('comp1').material('mat1').propertyGroup('ic').func('int1').set('extrap', 'linear');
model.component('comp1').material('mat1').propertyGroup('ic').func('int1').set('fununit', {'%'});
model.component('comp1').material('mat1').propertyGroup('ic').func('int1').set('argunit', {'1'});
model.component('comp1').material('mat1').propertyGroup('ic').set('dvol', 'dVOLdSOL(c/def.csmax)');
model.component('comp1').material('mat1').propertyGroup('ic').set('INFO_PREFIX:dvol', ['S. Schweidler, L. de Biasi, A. Schiele, P. Hartmann, T. Brezesinski and J. Janek, "Volume Changes of Graphite Anodes Revisited: A Combined Operando X-Ray Diffraction and In Situ Pressure Analysis Study", J. Phys. Chem. C, 2018, 122, 8829' native2unicode(hex2dec({'20' '13'}), 'unicode') '8835']);
model.component('comp1').material('mat1').propertyGroup('ic').addInput('concentration');
model.component('comp1').material('mat1').propertyGroup('EquilibriumConcentration').label('Equilibrium concentration');
model.component('comp1').material('mat1').propertyGroup('EquilibriumConcentration').set('csEq', 'def.csmax*elpot.Eeq_inv(V)');
model.component('comp1').material('mat1').propertyGroup('EquilibriumConcentration').addInput('electricpotential');
model.component('comp1').material('mat1').selection.set([]);
model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material('mat2').propertyGroup('def').func.create('int1', 'Interpolation');
model.component('comp1').material('mat2').propertyGroup.create('ElectrolyteConductivity', 'Electrolyte conductivity');
model.component('comp1').material('mat2').propertyGroup.create('SpeciesProperties', 'Species properties');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func.create('int1', 'Interpolation');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func.create('int2', 'Interpolation');
model.component('comp1').material('mat2').propertyGroup.create('ElectrolyteSaltConcentration', 'Electrolyte salt concentration');
model.component('comp1').material('mat2').label('LiPF6 in 1:1 EC:DEC (Liquid, Li-ion Battery)');
model.component('comp1').material('mat2').propertyGroup('def').label('Basic');
model.component('comp1').material('mat2').propertyGroup('def').func('int1').set('source', 'file');
model.component('comp1').material('mat2').propertyGroup('def').func('int1').label('Interpolation 1');
model.component('comp1').material('mat2').propertyGroup('def').func('int1').set('importedname', 'DL_ECDEC.txt');
model.component('comp1').material('mat2').propertyGroup('def').func('int1').set('importeddim', '2D');
model.component('comp1').material('mat2').propertyGroup('def').func('int1').set('funcs', {'DL_int1' '1'});
model.component('comp1').material('mat2').propertyGroup('def').func('int1').set('fununit', {'m^2/s'});
model.component('comp1').material('mat2').propertyGroup('def').func('int1').set('argunit', {'' ''});
model.component('comp1').material('mat2').propertyGroup('def').func('int1').set('sourcetype', 'model');
model.component('comp1').material('mat2').propertyGroup('def').func('int1').set('nargs', '2');
model.component('comp1').material('mat2').propertyGroup('def').func('int1').set('struct', 'spreadsheet');
model.component('comp1').material('mat2').propertyGroup('def').set('diffusion', {'DL_int1(c2/1[mol/m^3],T2/1[K])' '0' '0' '0' 'DL_int1(c2/1[mol/m^3],T2/1[K])' '0' '0' '0' 'DL_int1(c2/1[mol/m^3],T2/1[K])'});
model.component('comp1').material('mat2').propertyGroup('def').set('INFO_PREFIX:diffusion', ['D. Stephenson, E. Hartman, J. Harb, D. Wheeler, "Modeling of Particle-Particle Interactions in Porous Cathodes for Lithium-Ion Batteries", J. Electrochem. Soc., vol. 154, p. A1146, 2007' newline ]);
model.component('comp1').material('mat2').propertyGroup('def').set('c2', 'min(1500,max(c,500))');
model.component('comp1').material('mat2').propertyGroup('def').descr('c2', '');
model.component('comp1').material('mat2').propertyGroup('def').set('T2', 'min(313.15,max(T,283.15))');
model.component('comp1').material('mat2').propertyGroup('def').descr('T2', '');
model.component('comp1').material('mat2').propertyGroup('def').addInput('concentration');
model.component('comp1').material('mat2').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteConductivity').label('Electrolyte conductivity');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteConductivity').set('sigmal', {'1.147[mS/cm]*exp(520[J/mol]/R_const*(1/298[K]-1/T3))*(c3/1000[mol/m^3])^3-22.38[mS/cm]*exp(1010[J/mol]/R_const*(1/298[K]-1/T3))*(c3/1000[mol/m^3])^1.5+29.15[mS/cm]*exp(1270[J/mol]/R_const*(1/298[K]-1/T3))*(c3/1000[mol/m^3])' '0' '0' '0' '1.147[mS/cm]*exp(520[J/mol]/R_const*(1/298[K]-1/T3))*(c3/1000[mol/m^3])^3-22.38[mS/cm]*exp(1010[J/mol]/R_const*(1/298[K]-1/T3))*(c3/1000[mol/m^3])^1.5+29.15[mS/cm]*exp(1270[J/mol]/R_const*(1/298[K]-1/T3))*(c3/1000[mol/m^3])' '0' '0' '0' '1.147[mS/cm]*exp(520[J/mol]/R_const*(1/298[K]-1/T3))*(c3/1000[mol/m^3])^3-22.38[mS/cm]*exp(1010[J/mol]/R_const*(1/298[K]-1/T3))*(c3/1000[mol/m^3])^1.5+29.15[mS/cm]*exp(1270[J/mol]/R_const*(1/298[K]-1/T3))*(c3/1000[mol/m^3])'});
model.component('comp1').material('mat2').propertyGroup('ElectrolyteConductivity').set('INFO_PREFIX:sigmal', ['D. Stephenson, E. Hartman, J. Harb, D. Wheeler, "Modeling of Particle-Particle Interactions in Porous Cathodes for Lithium-Ion Batteries", J. Electrochem. Soc., vol. 154, p. A1146, 2007' newline ]);
model.component('comp1').material('mat2').propertyGroup('ElectrolyteConductivity').set('c3', 'min(1500,max(c,eps))');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteConductivity').descr('c3', '');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteConductivity').set('T3', 'min(313.15,max(T,283.15))');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteConductivity').descr('T3', '');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteConductivity').addInput('concentration');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteConductivity').addInput('temperature');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').label('Species properties');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').set('source', 'file');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').label('Interpolation 1');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').set('importedname', 'transpNm_ECDEC.txt');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').set('importeddim', '2D');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').set('funcs', {'transpNm_int1' '1'});
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').set('fununit', {''});
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').set('argunit', {'' ''});
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').set('sourcetype', 'model');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').set('nargs', '2');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int1').set('struct', 'spreadsheet');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').set('source', 'file');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').label('Interpolation 2');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').set('importedname', 'actdep_ECDEC.txt');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').set('importeddim', '2D');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').set('funcs', {'actdep_int1' '1'});
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').set('fununit', {''});
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').set('argunit', {'' ''});
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').set('sourcetype', 'model');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').set('nargs', '2');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').func('int2').set('struct', 'spreadsheet');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').set('transpNum', 'transpNm_int1(c4/1[mol/m^3],T4/1[K])');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').set('INFO_PREFIX:transpNum', ['D. Stephenson, E. Hartman, J. Harb, D. Wheeler, "Modeling of Particle-Particle Interactions in Porous Cathodes for Lithium-Ion Batteries", J. Electrochem. Soc., vol. 154, p. A1146, 2007' newline ]);
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').set('fcl', 'actdep_int1(c4/1[mol/m^3],T4/1[K])');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').set('INFO_PREFIX:fcl', ['D. Stephenson, E. Hartman, J. Harb, D. Wheeler, "Modeling of Particle-Particle Interactions in Porous Cathodes for Lithium-Ion Batteries", J. Electrochem. Soc., vol. 154, p. A1146, 2007' newline ]);
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').set('c4', 'min(1500,max(c,500))');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').descr('c4', '');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').set('T4', 'min(313.15,max(T,283.15))');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').descr('T4', '');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').addInput('concentration');
model.component('comp1').material('mat2').propertyGroup('SpeciesProperties').addInput('temperature');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteSaltConcentration').label('Electrolyte salt concentration');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteSaltConcentration').identifier('cElsalt');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteSaltConcentration').set('cElsalt', '1000[mol/m^3]');
model.component('comp1').material('mat2').propertyGroup('ElectrolyteSaltConcentration').set('INFO_PREFIX:cElsalt', ['D. Stephenson, E. Hartman, J. Harb, D. Wheeler, "Modeling of Particle-Particle Interactions in Porous Cathodes for Lithium-Ion Batteries", J. Electrochem. Soc., vol. 154, p. A1146, 2007' newline ]);
model.component('comp1').material('mat2').selection.set([2]);
model.component('comp1').material('mat1').selection.set([1 3]);

model.component('comp1').physics('cd').create('pce1', 'PorousElectrode', 2);
model.component('comp1').physics('cd').feature('pce1').selection.set([1 3]);
model.component('comp1').physics('cd').create('pot1', 'ElectricPotential', 1);
model.component('comp1').physics('cd').feature('pot1').selection.set([3]);
model.component('comp1').physics('cd').create('egnd1', 'ElectricGround', 1);
model.component('comp1').physics('cd').feature('egnd1').selection.set([9]);

model.component('comp1').material('mat1').propertyGroup.create('ElectrolyteConductivity', 'Electrolyte_conductivity');
model.component('comp1').material('mat1').propertyGroup('ElectrolyteConductivity').set('sigmal', {'2[S/m]'});

model.component('comp1').physics('cd').feature('ice1').set('minput_concentration', 1000);
model.component('comp1').physics('cd').feature('pce1').set('minput_concentration', 1000);
model.component('comp1').physics('cd').feature('pce1').set('epsl', 0.67);
model.component('comp1').physics('cd').feature('pce1').set('epss', 0.33);
model.component('comp1').physics('cd').feature('pce1').feature('per1').active(false);
model.component('comp1').physics('cd').feature('pce1').create('pdl1', 'PorousMatrixDoubleLayerCapacitance', 2);

model.param.set('V_max', '2.7[V]');
model.param.set('V_min', '0[V]');
model.param.set('v', '10[V/s]');
model.param.set('tH', '(V_max-V_min)/v', [native2unicode(hex2dec({'53' '4a'}), 'unicode')  native2unicode(hex2dec({'54' '68'}), 'unicode')  native2unicode(hex2dec({'67' '1f'}), 'unicode') ]);

model.component('comp1').func.create('int1', 'Interpolation');
model.component('comp1').func('int1').set('funcname', 'V_in');
model.component('comp1').func('int1').setIndex('table', 0, 0, 0);
model.component('comp1').func('int1').setIndex('table', 'V_min', 0, 1);
model.component('comp1').func('int1').setIndex('table', 'tH', 1, 0);
model.component('comp1').func('int1').setIndex('table', 'V_max', 1, 1);
model.component('comp1').func('int1').setIndex('table', 'tH', 2, 0);
model.component('comp1').func('int1').setIndex('table', 'tH*2', 2, 0);
model.component('comp1').func('int1').setIndex('table', 'tH', 3, 0);
model.component('comp1').func('int1').setIndex('table', 'tH*3', 3, 0);
model.component('comp1').func('int1').setIndex('table', 'tH', 4, 0);
model.component('comp1').func('int1').setIndex('table', 'tH*4', 4, 0);
model.component('comp1').func('int1').setIndex('table', 'V_min', 2, 1);
model.component('comp1').func('int1').setIndex('table', 'V_min', 4, 1);
model.component('comp1').func('int1').setIndex('table', 'V_max', 3, 1);
model.component('comp1').func('int1').setIndex('fununit', 'V', 0);
model.component('comp1').func('int1').setIndex('argunit', 's', 0);

model.component('comp1').physics('cd').feature('pot1').set('phisbnd', 'V_in(t)');

model.param.descr('v', [native2unicode(hex2dec({'62' '6b'}), 'unicode')  native2unicode(hex2dec({'63' 'cf'}), 'unicode')  native2unicode(hex2dec({'90' '1f'}), 'unicode')  native2unicode(hex2dec({'73' '87'}), 'unicode') ]);

model.component('comp1').mesh('mesh1').run;

model.study('std1').feature('time').set('tlist', 'range(0,tH/10,tH*4)');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'Default');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result.dataset.create('rev1', 'Revolve2D');
model.result.dataset('rev1').set('data', 'dset1');
model.result.dataset('rev1').set('revangle', 225);
model.result.dataset('rev1').set('startangle', -90);
model.result.dataset('rev1').set('hasspacevars', true);
model.result.create('pg1', 'PlotGroup2D');
model.result('pg1').set('data', 'dset1');
model.result('pg1').setIndex('looplevel', 41, 0);
model.result('pg1').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'4f' '4d'}), 'unicode') ' (cd)']);
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', {'phil'});
model.result('pg1').create('arws1', 'ArrowSurface');
model.result('pg1').feature('arws1').set('expr', {'cd.Ilr' 'cd.Ilz'});
model.result('pg1').feature('arws1').set('arrowbase', 'center');
model.result('pg1').feature('arws1').set('color', 'gray');
model.result.create('pg2', 'PlotGroup3D');
model.result('pg2').set('data', 'rev1');
model.result('pg2').setIndex('looplevel', 41, 0);
model.result('pg2').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'4f' '4d'}), 'unicode') ', 3D (cd)']);
model.result('pg2').create('mslc1', 'Multislice');
model.result('pg2').feature('mslc1').set('expr', {'phil'});
model.result('pg2').create('arwv1', 'ArrowVolume');
model.result('pg2').feature('arwv1').set('revcoordsys', 'cylindrical');
model.result('pg2').feature('arwv1').set('expr', {'cd.Ilr' 'cd.Ilphi' 'cd.Ilz'});
model.result('pg2').feature('arwv1').set('arrowbase', 'center');
model.result('pg2').feature('arwv1').set('color', 'gray');
model.result.create('pg3', 'PlotGroup2D');
model.result('pg3').set('data', 'dset1');
model.result('pg3').setIndex('looplevel', 41, 0);
model.result('pg3').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ' (cd)']);
model.result('pg3').create('arws1', 'ArrowSurface');
model.result('pg3').feature('arws1').set('expr', {'cd.Ilr' 'cd.Ilz'});
model.result('pg3').feature('arws1').set('arrowbase', 'center');
model.result('pg3').feature('arws1').set('color', 'gray');
model.result('pg3').feature('arws1').create('col1', 'Color');
model.result('pg3').feature('arws1').feature('col1').set('expr', 'root.comp1.cd.IlMag');
model.result.create('pg4', 'PlotGroup3D');
model.result('pg4').set('data', 'rev1');
model.result('pg4').setIndex('looplevel', 41, 0);
model.result('pg4').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ', 3D (cd)']);
model.result('pg4').create('arwv1', 'ArrowVolume');
model.result('pg4').feature('arwv1').set('revcoordsys', 'cylindrical');
model.result('pg4').feature('arwv1').set('expr', {'cd.Ilr' 'cd.Ilphi' 'cd.Ilz'});
model.result('pg4').feature('arwv1').set('arrowbase', 'center');
model.result('pg4').feature('arwv1').set('color', 'gray');
model.result('pg4').feature('arwv1').create('col1', 'Color');
model.result('pg4').feature('arwv1').feature('col1').set('expr', 'root.comp1.cd.IlMag');
model.result.create('pg5', 'PlotGroup2D');
model.result('pg5').set('data', 'dset1');
model.result('pg5').setIndex('looplevel', 41, 0);
model.result('pg5').label([native2unicode(hex2dec({'5b' 'f9'}), 'unicode')  native2unicode(hex2dec({'57' '30'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'4f' '4d'}), 'unicode') ' (cd)']);
model.result.create('pg6', 'PlotGroup3D');
model.result('pg6').set('data', 'rev1');
model.result('pg6').setIndex('looplevel', 41, 0);
model.result('pg6').label([native2unicode(hex2dec({'5b' 'f9'}), 'unicode')  native2unicode(hex2dec({'57' '30'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'4f' '4d'}), 'unicode') ', 3D (cd)']);
model.result('pg5').create('surf1', 'Surface');
model.result('pg5').feature('surf1').set('expr', {'phis'});
model.result('pg5').create('arws1', 'ArrowSurface');
model.result('pg5').feature('arws1').set('expr', {'cd.Isr' 'cd.Isz'});
model.result('pg5').feature('arws1').set('arrowbase', 'center');
model.result('pg5').feature('arws1').set('color', 'gray');
model.result('pg6').create('mslc1', 'Multislice');
model.result('pg6').feature('mslc1').set('expr', {'phis'});
model.result('pg6').create('arwv1', 'ArrowVolume');
model.result('pg6').feature('arwv1').set('revcoordsys', 'cylindrical');
model.result('pg6').feature('arwv1').set('expr', {'cd.Isr' 'cd.Isphi' 'cd.Isz'});
model.result('pg6').feature('arwv1').set('arrowbase', 'center');
model.result('pg6').feature('arwv1').set('color', 'gray');
model.result.create('pg7', 'PlotGroup2D');
model.result('pg7').set('data', 'dset1');
model.result('pg7').setIndex('looplevel', 41, 0);
model.result('pg7').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ' (cd)']);
model.result('pg7').create('arws1', 'ArrowSurface');
model.result('pg7').feature('arws1').set('expr', {'cd.Isr' 'cd.Isz'});
model.result('pg7').feature('arws1').set('arrowbase', 'center');
model.result('pg7').feature('arws1').set('color', 'gray');
model.result('pg7').feature('arws1').create('col1', 'Color');
model.result('pg7').feature('arws1').feature('col1').set('expr', 'root.comp1.cd.IsMag');
model.result.create('pg8', 'PlotGroup3D');
model.result('pg8').set('data', 'rev1');
model.result('pg8').setIndex('looplevel', 41, 0);
model.result('pg8').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ', 3D (cd)']);
model.result('pg8').create('arwv1', 'ArrowVolume');
model.result('pg8').feature('arwv1').set('revcoordsys', 'cylindrical');
model.result('pg8').feature('arwv1').set('expr', {'cd.Isr' 'cd.Isphi' 'cd.Isz'});
model.result('pg8').feature('arwv1').set('arrowbase', 'center');
model.result('pg8').feature('arwv1').set('color', 'gray');
model.result('pg8').feature('arwv1').create('col1', 'Color');
model.result('pg8').feature('arwv1').feature('col1').set('expr', 'root.comp1.cd.IsMag');
model.result('pg1').run;
model.result.create('pg9', 'PlotGroup1D');
model.result('pg9').run;
model.result('pg9').create('ptgr1', 'PointGraph');
model.result('pg9').feature('ptgr1').set('markerpos', 'datapoints');
model.result('pg9').feature('ptgr1').set('linewidth', 'preference');
model.result('pg9').feature('ptgr1').selection.set([4]);
model.result('pg9').feature('ptgr1').set('expr', 'phis');
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').feature('ptgr1').set('xdata', 'expr');
model.result('pg9').feature('ptgr1').set('xdataexpr', 'cd.itot');
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').set('switchxy', true);
model.result('pg9').run;
model.result('pg9').run;

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').run;
model.result('pg3').run;
model.result('pg5').run;
model.result('pg4').run;
model.result('pg6').run;
model.result('pg7').run;
model.result('pg8').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;

model.label(['[LBL' native2unicode(hex2dec({'53' '47'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode') ']B' native2unicode(hex2dec({'7a' 'd9'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode') '--' native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') ' - ' native2unicode(hex2dec({'52' '6f'}), 'unicode')  native2unicode(hex2dec({'67' '2c'}), 'unicode') '.mph']);

model.result('pg9').run;

model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('r3');

model.component('comp1').physics('cd').feature('egnd1').selection.set([3]);
model.component('comp1').physics('cd').feature('pot1').selection.set([9]);

model.component('comp1').geom('geom1').feature.duplicate('r4', 'r3');
model.component('comp1').geom('geom1').feature('r4').set('pos', [5 0]);
model.component('comp1').geom('geom1').run('r4');
model.component('comp1').geom('geom1').feature.duplicate('r5', 'r4');
model.component('comp1').geom('geom1').feature.duplicate('r6', 'r5');
model.component('comp1').geom('geom1').feature.duplicate('r7', 'r5');
model.component('comp1').geom('geom1').feature.duplicate('r8', 'r5');
model.component('comp1').geom('geom1').feature.duplicate('r9', 'r5');
model.component('comp1').geom('geom1').feature.duplicate('r10', 'r8');
model.component('comp1').geom('geom1').feature.duplicate('r11', 'r10');
model.component('comp1').geom('geom1').feature.duplicate('r12', 'r10');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').feature('r2').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 2-' native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode') ]);
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('r3');
model.component('comp1').geom('geom1').feature('r3').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') '3 ZMO']);
model.component('comp1').geom('geom1').feature('r4').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 4' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r6').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 6' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r8').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 8' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r10').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 10' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r12').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 12' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r5').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 5ZMO']);
model.component('comp1').geom('geom1').feature('r7').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 7ZMO']);
model.component('comp1').geom('geom1').feature('r9').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 9ZMO']);
model.component('comp1').geom('geom1').feature('r11').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 11ZMO']);
model.component('comp1').geom('geom1').feature.move('r4', 2);
model.component('comp1').geom('geom1').feature.move('r4', 3);
model.component('comp1').geom('geom1').feature('r4').set('size', [0.1 10]);
model.component('comp1').geom('geom1').feature('r3').set('size', [0.5 10]);
model.component('comp1').geom('geom1').feature('r4').set('size', [0.01 10]);
model.component('comp1').geom('geom1').feature('r5').set('size', [0.5 10]);
model.component('comp1').geom('geom1').feature('r6').set('size', [0.01 10]);
model.component('comp1').geom('geom1').feature('r7').set('size', [0.5 10]);
model.component('comp1').geom('geom1').feature('r8').set('size', [0.01 10]);
model.component('comp1').geom('geom1').feature('r9').set('size', [0.5 10]);
model.component('comp1').geom('geom1').feature('r10').set('size', [0.01 10]);
model.component('comp1').geom('geom1').feature('r11').set('size', [0.5 10]);
model.component('comp1').geom('geom1').feature('r12').set('size', [0.01 10]);
model.component('comp1').geom('geom1').feature('r4').set('pos', [3.5 0]);
model.component('comp1').geom('geom1').feature('r5').set('pos', [3.51 0]);
model.component('comp1').geom('geom1').run('r5');
model.component('comp1').geom('geom1').feature('r6').set('pos', [4.01 0]);
model.component('comp1').geom('geom1').run('r6');
model.component('comp1').geom('geom1').feature('r7').set('pos', [4.02 0]);
model.component('comp1').geom('geom1').run('r7');
model.component('comp1').geom('geom1').feature('r8').set('pos', [4.52 0]);
model.component('comp1').geom('geom1').run('r8');
model.component('comp1').geom('geom1').feature('r9').set('pos', [4.53 0]);
model.component('comp1').geom('geom1').run('r9');
model.component('comp1').geom('geom1').feature('r10').set('pos', [5.03 0]);
model.component('comp1').geom('geom1').run('r10');
model.component('comp1').geom('geom1').feature('r11').set('pos', [5.04 0]);
model.component('comp1').geom('geom1').run('r11');
model.component('comp1').geom('geom1').feature('r12').set('pos', [5.54 0]);
model.component('comp1').geom('geom1').run('r12');
model.component('comp1').geom('geom1').run('r12');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').material('mat1').selection.set([1]);

model.label(['[LBL' native2unicode(hex2dec({'53' '47'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode') ']B' native2unicode(hex2dec({'7a' 'd9'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode') '--' native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') ' - ' native2unicode(hex2dec({'52' '6f'}), 'unicode')  native2unicode(hex2dec({'67' '2c'}), 'unicode') '.mph']);

model.component('comp1').geom('geom1').run('r4');
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').feature('r1').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 1' native2unicode(hex2dec({'6d' '3b'}), 'unicode')  native2unicode(hex2dec({'60' '27'}), 'unicode')  native2unicode(hex2dec({'70' 'ad'}), 'unicode') ]);
model.component('comp1').geom('geom1').run('r1');

model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material('mat3').propertyGroup.create('ElectrodePotential', 'Equilibrium potential');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func.create('int1', 'Interpolation');
model.component('comp1').material('mat3').propertyGroup.create('OperationalSOC', 'Operational electrode state of charge');
model.component('comp1').material('mat3').propertyGroup.create('EquilibriumConcentration', 'Equilibrium concentration');
model.component('comp1').material('mat3').label('Hard Carbon (Negative, Li-ion Battery)');
model.component('comp1').material('mat3').comments(['vs Li/Li+, T=25 C' newline 'Eeq for fully lithiated at 0.79' newline 'Eeq for delithiated at 0.02' newline  newline 'Reference' newline 'D. P Karthikeyan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermodynamic model development for lithium intercalation electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources, vol. 185, p. 1398, 2008.' newline ]);
model.component('comp1').material('mat3').propertyGroup('def').label('Basic');
model.component('comp1').material('mat3').propertyGroup('def').set('diffusion', {'3.9e-14[m^2/s]' '0' '0' '0' '3.9e-14[m^2/s]' '0' '0' '0' '3.9e-14[m^2/s]'});
model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'100[S/m]' '0' '0' '0' '100[S/m]' '0' '0' '0' '100[S/m]'});
model.component('comp1').material('mat3').propertyGroup('def').set('density', '2260[kg/m^3]');
model.component('comp1').material('mat3').propertyGroup('def').set('csmax', '30550[mol/m^3]');
model.component('comp1').material('mat3').propertyGroup('def').descr('csmax', '');
model.component('comp1').material('mat3').propertyGroup('def').addInput('concentration');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').label('Equilibrium potential');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').label('Interpolation 1');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('funcname', 'Eeq_int1');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('table', {'0.0210' '0.7144';  ...
'0.0356' '0.6297';  ...
'0.0501' '0.5851';  ...
'0.0703' '0.5540';  ...
'0.0935' '0.5228';  ...
'0.1050' '0.5051';  ...
'0.1223' '0.4873';  ...
'0.1368' '0.4650';  ...
'0.1541' '0.4518';  ...
'0.1714' '0.4295';  ...
'0.1887' '0.4162';  ...
'0.2032' '0.3940';  ...
'0.2176' '0.3761';  ...
'0.2349' '0.3585';  ...
'0.2522' '0.3452';  ...
'0.2811' '0.3096';  ...
'0.2984' '0.2963';  ...
'0.3129' '0.2785';  ...
'0.3302' '0.2608';  ...
'0.3446' '0.2475';  ...
'0.3648' '0.2342';  ...
'0.3792' '0.2209';  ...
'0.3965' '0.2076';  ...
'0.4110' '0.1943';  ...
'0.4283' '0.1810';  ...
'0.4426' '0.1676';  ...
'0.4571' '0.1588';  ...
'0.4773' '0.1500';  ...
'0.4917' '0.1367';  ...
'0.5119' '0.1279';  ...
'0.5263' '0.1190';  ...
'0.5407' '0.1102';  ...
'0.5580' '0.0969';  ...
'0.5753' '0.0880';  ...
'0.5897' '0.0836';  ...
'0.6040' '0.0748';  ...
'0.6214' '0.0660';  ...
'0.6358' '0.0616';  ...
'0.6531' '0.0572';  ...
'0.6703' '0.0528';  ...
'0.6848' '0.0485';  ...
'0.7020' '0.0484';  ...
'0.7193' '0.0442';  ...
'0.7337' '0.0398';  ...
'0.7510' '0.0397';  ...
'0.7682' '0.0355';  ...
'0.7826' '0.0318';  ...
'0.7913' '0.0310'});
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('extrap', 'linear');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('fununit', {'V'});
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('argunit', {'1'});
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('defineinv', true);
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').func('int1').set('funcinvname', 'Eeq_inv');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('Eeq', 'Eeq_int1(soc)');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('INFO_PREFIX:Eeq', ['D. P Karthikeyan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermodynamic model development for lithium intercalation electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources, vol. 185, p. 1398, 2008.']);
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('dEeqdT', '0[V/K]');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('cEeqref', 'def.csmax');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').set('soc', 'c/cEeqref');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').descr('soc', '');
model.component('comp1').material('mat3').propertyGroup('ElectrodePotential').addInput('concentration');
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').label('Operational electrode state of charge');
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('socmax', 'elpot.Eeq_inv(E_min)');
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('socmin', 'elpot.Eeq_inv(E_max)');
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('E_max', '0.7[V]');
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('E_min', '0.05[V]');
model.component('comp1').material('mat3').propertyGroup('EquilibriumConcentration').label('Equilibrium concentration');
model.component('comp1').material('mat3').propertyGroup('EquilibriumConcentration').set('csEq', 'def.csmax*elpot.Eeq_inv(V)');
model.component('comp1').material('mat3').propertyGroup('EquilibriumConcentration').addInput('electricpotential');
model.component('comp1').material('mat3').selection.set([1]);
model.component('comp1').material('mat3').label([native2unicode(hex2dec({'8d' '1f'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode') 'Hard Carbon (Negative, Li-ion Battery)']);
model.component('comp1').material('mat3').propertyGroup.create('ElectrolyteConductivity', 'Electrolyte_conductivity');
model.component('comp1').material('mat3').propertyGroup('ElectrolyteConductivity').set('sigmal', {'32.4'});
model.material.create('mat4', 'Common', '');
model.material('mat4').propertyGroup.create('ElectrodePotential', 'Equilibrium potential');
model.material('mat4').propertyGroup('ElectrodePotential').func.create('int1', 'Interpolation');
model.material('mat4').propertyGroup('ElectrodePotential').func.create('int2', 'Interpolation');
model.material('mat4').propertyGroup.create('OperationalSOC', 'Operational electrode state of charge');
model.material('mat4').propertyGroup.create('EquilibriumConcentration', 'Equilibrium concentration');
model.material('mat4').propertyGroup.create('ElectrolyteConductivity', [native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'fc'}), 'unicode')  native2unicode(hex2dec({'73' '87'}), 'unicode') ]);
model.material('mat4').label('ZnMnO4');
model.material('mat4').propertyGroup('def').label('Basic');
model.material('mat4').propertyGroup('def').set('youngsmodulus', '');
model.material('mat4').propertyGroup('def').set('poissonsratio', '');
model.material('mat4').propertyGroup('def').set('youngsmodulus', '194[GPa]');
model.material('mat4').propertyGroup('def').set('INFO_PREFIX:youngsmodulus', 'Yue Qi et al 2014 J. Electrochem. Soc. 161 F3010');
model.material('mat4').propertyGroup('def').set('poissonsratio', '0.26');
model.material('mat4').propertyGroup('def').set('INFO_PREFIX:poissonsratio', 'Yue Qi et al 2014 J. Electrochem. Soc. 161 F3010');
model.material('mat4').propertyGroup('def').set('electricconductivity', {'3e3[S/m]' '0' '0' '0' '3e3[S/m]' '0' '0' '0' '3e3[S/m]'});
model.material('mat4').propertyGroup('def').set('INFO_PREFIX:electricconductivity', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.material('mat4').propertyGroup('def').set('diffusion', {'1e-14*exp(20000/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1e-14*exp(20000/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1e-14*exp(20000/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]'});
model.material('mat4').propertyGroup('def').set('INFO_PREFIX:diffusion', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.material('mat4').propertyGroup('def').set('density', '1950[kg/m^3]');
model.material('mat4').propertyGroup('def').set('INFO_PREFIX:density', 'N. Nitta, F. Wu, J. Tae Lee, and G. Yushin, Materials Today, Volume 18, Number 5, June 2015');
model.material('mat4').propertyGroup('def').set('T_ref', '298[K]');
model.material('mat4').propertyGroup('def').descr('T_ref', '');
model.material('mat4').propertyGroup('def').set('T2', 'min(393.15,max(T,223.15))');
model.material('mat4').propertyGroup('def').descr('T2', '');
model.material('mat4').propertyGroup('def').set('csmax', '22860[mol/m^3]');
model.material('mat4').propertyGroup('def').descr('csmax', '');
model.material('mat4').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat4').propertyGroup('def').set('heatcapacity', '710[J/(kg*K)]');
model.material('mat4').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.material('mat4').propertyGroup('def').set('emissivity', '1');
model.material('mat4').propertyGroup('def').set('thermalconductivity', {'150[W/(m*K)]*(300[K]/T)' '0' '0' '0' '150[W/(m*K)]*(300[K]/T)' '0' '0' '0' '150[W/(m*K)]*(300[K]/T)'});
model.material('mat4').propertyGroup('def').addInput('temperature');
model.material('mat4').propertyGroup('ElectrodePotential').label('Equilibrium potential');
model.material('mat4').propertyGroup('ElectrodePotential').func('int1').label('Interpolation 1');
model.material('mat4').propertyGroup('ElectrodePotential').func('int1').set('funcname', 'Eeq_int1');
model.material('mat4').propertyGroup('ElectrodePotential').func('int1').set('table', {'0.1750' '4.2763';  ...
'0.1950' '4.1898';  ...
'0.2150' '4.1507';  ...
'0.2350' '4.133';  ...
'0.2550' '4.1248';  ...
'0.2750' '4.1209';  ...
'0.2950' '4.119';  ...
'0.3150' '4.1179';  ...
'0.3350' '4.1171';  ...
'0.3550' '4.1165';  ...
'0.3750' '4.116';  ...
'0.3950' '4.1153';  ...
'0.4150' '4.1145';  ...
'0.4350' '4.1135';  ...
'0.4550' '4.1121';  ...
'0.4750' '4.1099';  ...
'0.4950' '4.1066';  ...
'0.5150' '4.1014';  ...
'0.5350' '4.0934';  ...
'0.5550' '4.082';  ...
'0.5750' '4.067';  ...
'0.5950' '4.05';  ...
'0.6150' '4.0333';  ...
'0.6350' '4.0192';  ...
'0.6550' '4.0087';  ...
'0.6750' '4.0012';  ...
'0.6950' '3.996';  ...
'0.7150' '3.9923';  ...
'0.7350' '3.9893';  ...
'0.7550' '3.9867';  ...
'0.7750' '3.9841';  ...
'0.7950' '3.9813';  ...
'0.8150' '3.9783';  ...
'0.8350' '3.9747';  ...
'0.8550' '3.9705';  ...
'0.8750' '3.9652';  ...
'0.8950' '3.9585';  ...
'0.9150' '3.9493';  ...
'0.9350' '3.9361';  ...
'0.9550' '3.9144';  ...
'0.9750' '3.869';  ...
'0.9950' '3.5944';  ...
'' ''});
model.material('mat4').propertyGroup('ElectrodePotential').func('int1').set('interp', 'piecewisecubic');
model.material('mat4').propertyGroup('ElectrodePotential').func('int1').set('extrap', 'linear');
model.material('mat4').propertyGroup('ElectrodePotential').func('int1').set('fununit', {'V'});
model.material('mat4').propertyGroup('ElectrodePotential').func('int1').set('argunit', {''});
model.material('mat4').propertyGroup('ElectrodePotential').func('int1').set('defineinv', true);
model.material('mat4').propertyGroup('ElectrodePotential').func('int1').set('funcinvname', 'Eeq_inv');
model.material('mat4').propertyGroup('ElectrodePotential').func('int2').label('Interpolation 2');
model.material('mat4').propertyGroup('ElectrodePotential').func('int2').set('funcname', 'dEeqdT_int1');
model.material('mat4').propertyGroup('ElectrodePotential').func('int2').set('table', {'0.15' '0.15e-3';  ...
'0.18' '0.25e-3';  ...
'0.20' '0.21e-3';  ...
'0.209' '0.19e-3';  ...
'0.26' '0.175e-3';  ...
'0.28' '0.166e-3';  ...
'0.30' '0.155e-3';  ...
'0.35' '0.11e-3';  ...
'0.394' '0.095e-3';  ...
'0.41' '0.05e-3';  ...
'0.437' '0.02e-3';  ...
'0.445' '0';  ...
'0.46' '-0.048e-3';  ...
'0.48' '-0.15e-3';  ...
'0.50' '-0.255e-3';  ...
'0.515' '-0.3e-3';  ...
'0.545' '-0.3e-3';  ...
'0.553' '-0.22e-3';  ...
'0.58' '-0.145e-3';  ...
'0.592' '-0.10e-3';  ...
'0.60' '0';  ...
'0.62' '0.08e-3';  ...
'0.64' '0.12e-3';  ...
'0.70' '0.124e-3';  ...
'0.72' '0.10e-3';  ...
'0.73' '0.05e-3';  ...
'0.76' '0';  ...
'0.78' '-0.057e-3';  ...
'0.81' '-0.08e-3';  ...
'0.86' '-0.10e-3';  ...
'0.91' '-0.16e-3';  ...
'0.96' '-0.22e-3';  ...
'0.98' '-0.30e-3'});
model.material('mat4').propertyGroup('ElectrodePotential').func('int2').set('interp', 'piecewisecubic');
model.material('mat4').propertyGroup('ElectrodePotential').func('int2').set('fununit', {'V/K'});
model.material('mat4').propertyGroup('ElectrodePotential').func('int2').set('argunit', {''});
model.material('mat4').propertyGroup('ElectrodePotential').set('Eeq', 'Eeq_int1(soc)+dEeqdT_int1(soc)*(T-298[K])');
model.material('mat4').propertyGroup('ElectrodePotential').set('INFO_PREFIX:Eeq', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.material('mat4').propertyGroup('ElectrodePotential').set('dEeqdT', 'dEeqdT_int1(soc)');
model.material('mat4').propertyGroup('ElectrodePotential').set('INFO_PREFIX:dEeqdT', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.material('mat4').propertyGroup('ElectrodePotential').set('cEeqref', 'def.csmax');
model.material('mat4').propertyGroup('ElectrodePotential').set('INFO_PREFIX:cEeqref', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.material('mat4').propertyGroup('ElectrodePotential').set('soc', 'c/cEeqref');
model.material('mat4').propertyGroup('ElectrodePotential').descr('soc', '');
model.material('mat4').propertyGroup('ElectrodePotential').addInput('concentration');
model.material('mat4').propertyGroup('ElectrodePotential').addInput('temperature');
model.material('mat4').propertyGroup('OperationalSOC').label('Operational electrode state of charge');
model.material('mat4').propertyGroup('OperationalSOC').set('socmax', 'elpot.Eeq_inv(E_min)');
model.material('mat4').propertyGroup('OperationalSOC').set('socmin', 'elpot.Eeq_inv(E_max)');
model.material('mat4').propertyGroup('OperationalSOC').set('E_max', '4.2[V]');
model.material('mat4').propertyGroup('OperationalSOC').set('E_min', '3.9[V]');
model.material('mat4').propertyGroup('EquilibriumConcentration').label('Equilibrium concentration');
model.material('mat4').propertyGroup('EquilibriumConcentration').set('csEq', 'def.csmax*elpot.Eeq_inv(V)');
model.material('mat4').propertyGroup('EquilibriumConcentration').addInput('electricpotential');
model.material('mat4').propertyGroup('ElectrolyteConductivity').set('sigmal', {'2[S/m]' '0' '0' '0' '2[S/m]' '0' '0' '0' '2[S/m]'});
model.material.create('mat5', 'Common', '');
model.material('mat5').propertyGroup('def').func.create('int1', 'Interpolation');
model.material('mat5').propertyGroup('def').func.create('int2', 'Interpolation');
model.material('mat5').propertyGroup.create('ElectrodePotential', 'Equilibrium potential');
model.material('mat5').propertyGroup('ElectrodePotential').func.create('int1', 'Interpolation');
model.material('mat5').propertyGroup('ElectrodePotential').func.create('int2', 'Interpolation');
model.material('mat5').propertyGroup.create('OperationalSOC', 'Operational electrode state of charge');
model.material('mat5').propertyGroup.create('ic', 'Intercalation strain');
model.material('mat5').propertyGroup('ic').func.create('int1', 'Interpolation');
model.material('mat5').propertyGroup.create('EquilibriumConcentration', 'Equilibrium concentration');
model.material('mat5').label('Graphite, LixC6 MCMB (Negative, Li-ion Battery) 1');
model.material('mat5').propertyGroup('def').label('Basic');
model.material('mat5').propertyGroup('def').func('int1').label('Interpolation 1');
model.material('mat5').propertyGroup('def').func('int1').set('funcname', 'E_int');
model.material('mat5').propertyGroup('def').func('int1').set('table', {'0' '32.47'; '0.333' '28.56'; '0.5' '58.06'; '1' '108.67'});
model.material('mat5').propertyGroup('def').func('int1').set('fununit', {'GPa'});
model.material('mat5').propertyGroup('def').func('int1').set('argunit', {'1'});
model.material('mat5').propertyGroup('def').func('int2').label('Interpolation 2');
model.material('mat5').propertyGroup('def').func('int2').set('funcname', 'nu_int');
model.material('mat5').propertyGroup('def').func('int2').set('table', {'0' '0.32'; '0.333' '0.39'; '0.5' '0.34'; '1' '0.24'});
model.material('mat5').propertyGroup('def').func('int2').set('fununit', {''});
model.material('mat5').propertyGroup('def').set('youngsmodulus', '');
model.material('mat5').propertyGroup('def').set('poissonsratio', '');
model.material('mat5').propertyGroup('def').set('youngsmodulus', 'E_int(c/csmax)');
model.material('mat5').propertyGroup('def').set('INFO_PREFIX:youngsmodulus', 'Yue Qi et al 2010 J. Electrochem. Soc. 157 A558');
model.material('mat5').propertyGroup('def').set('poissonsratio', 'nu_int(c/csmax)');
model.material('mat5').propertyGroup('def').set('INFO_PREFIX:poissonsratio', 'Yue Qi et al 2010 J. Electrochem. Soc. 157 A558');
model.material('mat5').propertyGroup('def').set('electricconductivity', {'100[S/m]' '0' '0' '0' '100[S/m]' '0' '0' '0' '100[S/m]'});
model.material('mat5').propertyGroup('def').set('INFO_PREFIX:electricconductivity', ['V. Srinivasan, and J. Newman, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Design and Optimization of a Natural Graphite/Iron Phosphate Lithium Ion Cell,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Electrochem. Soc., vol. 151, p. 1530, 2004.']);
model.material('mat5').propertyGroup('def').set('diffusion', {'1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]'});
model.material('mat5').propertyGroup('def').set('INFO_PREFIX:diffusion', ['K. Kumaresan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermal Model for a Li-Ion Cell,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Electrochem. Soc., vol. 155, p. A164, 2008.']);
model.material('mat5').propertyGroup('def').set('thermalconductivity', {'1[W/(m*K)]' '0' '0' '0' '1[W/(m*K)]' '0' '0' '0' '1[W/(m*K)]'});
model.material('mat5').propertyGroup('def').set('INFO_PREFIX:thermalconductivity', 'S. Chen, C. Wan, and Y. Wang, J. Power Sources, 140, 111 (2005).');
model.material('mat5').propertyGroup('def').set('heatcapacity', '750[J/(kg*K)]');
model.material('mat5').propertyGroup('def').set('INFO_PREFIX:heatcapacity', 'SI Chemical Data, John Wiley & Sons, 1994');
model.material('mat5').propertyGroup('def').set('density', '2300[kg/m^3]');
model.material('mat5').propertyGroup('def').set('INFO_PREFIX:density', 'SI Chemical Data, John Wiley & Sons, 1994');
model.material('mat5').propertyGroup('def').set('csmax', '31507[mol/m^3]');
model.material('mat5').propertyGroup('def').descr('csmax', '');
model.material('mat5').propertyGroup('def').set('T_ref', '318[K]');
model.material('mat5').propertyGroup('def').descr('T_ref', '');
model.material('mat5').propertyGroup('def').set('T2', 'min(393.15,max(T,223.15))');
model.material('mat5').propertyGroup('def').descr('T2', '');
model.material('mat5').propertyGroup('def').addInput('temperature');
model.material('mat5').propertyGroup('def').addInput('concentration');
model.material('mat5').propertyGroup('ElectrodePotential').label('Equilibrium potential');
model.material('mat5').propertyGroup('ElectrodePotential').func('int1').label('Interpolation 1');
model.material('mat5').propertyGroup('ElectrodePotential').func('int1').set('funcname', 'Eeq_int1');
model.material('mat5').propertyGroup('ElectrodePotential').func('int1').set('table', {'0' '2.781186612';  ...
'0.01' '1.520893224';  ...
'0.02' '0.893922607';  ...
'0.03' '0.581284406';  ...
'0.04' '0.42452844';  ...
'0.05' '0.344895805';  ...
'0.06' '0.303146342';  ...
'0.07' '0.279578072';  ...
'0.08' '0.264093089';  ...
'0.09' '0.251347845';  ...
'0.1' '0.238588379';  ...
'0.11' '0.224803164';  ...
'0.12' '0.210294358';  ...
'0.13' '0.196408586';  ...
'0.14' '0.184624188';  ...
'0.15' '0.175188157';  ...
'0.16' '0.167373311';  ...
'0.17' '0.160452107';  ...
'0.18' '0.154025412';  ...
'0.19' '0.147948522';  ...
'0.2' '0.142214997';  ...
'0.21' '0.13688271';  ...
'0.22' '0.132033114';  ...
'0.23' '0.127747573';  ...
'0.24' '0.124091616';  ...
'0.25' '0.121103387';  ...
'0.26' '0.11878567';  ...
'0.27' '0.117102317';  ...
'0.28' '0.115980205';  ...
'0.29' '0.115317054';  ...
'0.3' '0.114993965';  ...
'0.31' '0.114890105';  ...
'0.32' '0.114886278';  ...
'0.33' '0.114884619';  ...
'0.34' '0.114873068';  ...
'0.35' '0.114824904';  ...
'0.36' '0.114644725';  ...
'0.37' '0.114372614';  ...
'0.38' '0.114017954';  ...
'0.39' '0.11359371';  ...
'0.4' '0.11311133';  ...
'0.41' '0.112575849';  ...
'0.42' '0.111980245';  ...
'0.43' '0.111297682';  ...
'0.44' '0.110470149';  ...
'0.45' '0.109393081';  ...
'0.46' '0.107900592';  ...
'0.47' '0.10576964';  ...
'0.48' '0.102783317';  ...
'0.49' '0.09889031';  ...
'0.5' '0.094391564';  ...
'0.51' '0.089921069';  ...
'0.52' '0.086112415';  ...
'0.53' '0.083265315';  ...
'0.54' '0.081326247';  ...
'0.55' '0.080074892';  ...
'0.56' '0.07928329';  ...
'0.57' '0.078778765';  ...
'0.58' '0.078447703';  ...
'0.59' '0.078220432';  ...
'0.6' '0.078055641';  ...
'0.61' '0.077929111';  ...
'0.62' '0.077826563';  ...
'0.63' '0.077739397';  ...
'0.64' '0.077662227';  ...
'0.65' '0.077591472';  ...
'0.66' '0.077524557';  ...
'0.67' '0.077459463';  ...
'0.68' '0.077394455';  ...
'0.69' '0.077327934';  ...
'0.7' '0.077258337';  ...
'0.71' '0.077184077';  ...
'0.72' '0.077103499';  ...
'0.73' '0.077014851';  ...
'0.74' '0.076916258';  ...
'0.75' '0.07680571';  ...
'0.76' '0.07668104';  ...
'0.77' '0.07653992';  ...
'0.78' '0.076379839';  ...
'0.79' '0.076198086';  ...
'0.8' '0.075991699';  ...
'0.81' '0.075757371';  ...
'0.82' '0.075491288';  ...
'0.83' '0.075188813';  ...
'0.84' '0.07484398';  ...
'0.85' '0.074448647';  ...
'0.86' '0.07399118';  ...
'0.87' '0.073454466';  ...
'0.88' '0.072812991';  ...
'0.89' '0.072028722';  ...
'0.9' '0.071045433';  ...
'0.91' '0.069780996';  ...
'0.92' '0.068116222';  ...
'0.93' '0.065874599';  ...
'0.94' '0.062770873';  ...
'0.95' '0.058253898';  ...
'0.96' '0.051075794';  ...
'0.97' '0.038790069';  ...
'0.98' '0.020172191'});
model.material('mat5').propertyGroup('ElectrodePotential').func('int1').set('interp', 'piecewisecubic');
model.material('mat5').propertyGroup('ElectrodePotential').func('int1').set('extrap', 'linear');
model.material('mat5').propertyGroup('ElectrodePotential').func('int1').set('fununit', {'V'});
model.material('mat5').propertyGroup('ElectrodePotential').func('int1').set('argunit', {''});
model.material('mat5').propertyGroup('ElectrodePotential').func('int1').set('defineinv', true);
model.material('mat5').propertyGroup('ElectrodePotential').func('int1').set('funcinvname', 'Eeq_inv');
model.material('mat5').propertyGroup('ElectrodePotential').func('int2').label('Interpolation 2');
model.material('mat5').propertyGroup('ElectrodePotential').func('int2').set('funcname', 'dEeqdT_int1');
model.material('mat5').propertyGroup('ElectrodePotential').func('int2').set('table', {'0' '3.0e-4';  ...
'0.17' '0';  ...
'0.24' '-6e-5';  ...
'0.28' '-1.6e-4';  ...
'0.5' '-1.6e-4';  ...
'0.54' '-9e-5';  ...
'0.71' '-9e-5';  ...
'0.85' '-1.0e-4';  ...
'1.0' '-1.2e-4'});
model.material('mat5').propertyGroup('ElectrodePotential').func('int2').set('fununit', {'V/K'});
model.material('mat5').propertyGroup('ElectrodePotential').func('int2').set('argunit', {''});
model.material('mat5').propertyGroup('ElectrodePotential').set('Eeq', 'Eeq_int1(soc)+dEeqdT_int1(soc)*(T-298[K])');
model.material('mat5').propertyGroup('ElectrodePotential').set('INFO_PREFIX:Eeq', ['D. P Karthikeyan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermodynamic model development for lithium intercalation electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources, vol. 185, p. 1398, 2008.']);
model.material('mat5').propertyGroup('ElectrodePotential').set('dEeqdT', 'dEeqdT_int1(soc)');
model.material('mat5').propertyGroup('ElectrodePotential').set('INFO_PREFIX:dEeqdT', ['K. E. Thomas, and J. Newman, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Heats of mixing and of entropy in porous insertion electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources., vol. 119-121, p. 844, 2003.']);
model.material('mat5').propertyGroup('ElectrodePotential').set('cEeqref', 'def.csmax');
model.material('mat5').propertyGroup('ElectrodePotential').set('soc', 'c/cEeqref');
model.material('mat5').propertyGroup('ElectrodePotential').descr('soc', '');
model.material('mat5').propertyGroup('ElectrodePotential').addInput('concentration');
model.material('mat5').propertyGroup('ElectrodePotential').addInput('temperature');
model.material('mat5').propertyGroup('OperationalSOC').label('Operational electrode state of charge');
model.material('mat5').propertyGroup('OperationalSOC').set('socmax', 'elpot.Eeq_inv(E_min)');
model.material('mat5').propertyGroup('OperationalSOC').set('socmin', 'elpot.Eeq_inv(E_max)');
model.material('mat5').propertyGroup('OperationalSOC').set('E_max', '1[V]');
model.material('mat5').propertyGroup('OperationalSOC').set('E_min', '0.075[V]');
model.material('mat5').propertyGroup('ic').label('Intercalation strain');
model.material('mat5').propertyGroup('ic').func('int1').label('Interpolation 1');
model.material('mat5').propertyGroup('ic').func('int1').set('funcname', 'dVOLdSOL');
model.material('mat5').propertyGroup('ic').func('int1').set('table', {'0' '0';  ...
'0.006802721088435382' '0.12500000000000178';  ...
'0.06316812439261421' '1.2736486486486491';  ...
'0.11175898931000966' '2.523648648648649';  ...
'0.17978620019436342' '3.5709459459459474';  ...
'0.2400388726919339' '4.449324324324325';  ...
'0.2905733722060252' '5.192567567567568';  ...
'0.3566569484936831' '5.66554054054054';  ...
'0.4188532555879494' '5.969594594594595';  ...
'0.48104956268221566' '6.10472972972973';  ...
'0.5432458697764819' '6.173648648648647';  ...
'0.58600583090379' '6.306081081081081';  ...
'0.6112730806608356' '7.726351351351352';  ...
'0.6443148688046647' '8.570945945945946';  ...
'0.694849368318756' '9.449324324324323';  ...
'0.7414965986394557' '10.29391891891892';  ...
'0.7764820213799805' '10.902027027027025';  ...
'0.8231292517006802' '11.543918918918918';  ...
'0.8542274052478133' '12.152027027027026';  ...
'0.8833819241982507' '12.827702702702702';  ...
'0.9183673469387755' '12.996621621621621';  ...
'0.9494655004859086' '13.16554054054054'});
model.material('mat5').propertyGroup('ic').func('int1').set('extrap', 'linear');
model.material('mat5').propertyGroup('ic').func('int1').set('fununit', {'%'});
model.material('mat5').propertyGroup('ic').func('int1').set('argunit', {'1'});
model.material('mat5').propertyGroup('ic').set('dvol', 'dVOLdSOL(c/def.csmax)');
model.material('mat5').propertyGroup('ic').set('INFO_PREFIX:dvol', ['S. Schweidler, L. de Biasi, A. Schiele, P. Hartmann, T. Brezesinski and J. Janek, "Volume Changes of Graphite Anodes Revisited: A Combined Operando X-Ray Diffraction and In Situ Pressure Analysis Study", J. Phys. Chem. C, 2018, 122, 8829' native2unicode(hex2dec({'20' '13'}), 'unicode') '8835']);
model.material('mat5').propertyGroup('ic').addInput('concentration');
model.material('mat5').propertyGroup('EquilibriumConcentration').label('Equilibrium concentration');
model.material('mat5').propertyGroup('EquilibriumConcentration').set('csEq', 'def.csmax*elpot.Eeq_inv(V)');
model.material('mat5').propertyGroup('EquilibriumConcentration').addInput('electricpotential');
model.component('comp1').material.create('mat6', 'Common');
model.component('comp1').material('mat6').propertyGroup('def').func.create('int1', 'Interpolation');
model.component('comp1').material('mat6').propertyGroup('def').func.create('int2', 'Interpolation');
model.component('comp1').material('mat6').propertyGroup('def').func.create('int3', 'Interpolation');
model.component('comp1').material('mat6').propertyGroup.create('ElectrolyteConductivity', 'Electrolyte conductivity');
model.component('comp1').material('mat6').propertyGroup.create('SpeciesProperties', 'Species properties');
model.component('comp1').material('mat6').label('KOH (Liquid)');
model.component('comp1').material('mat6').comments([ newline ]);
model.component('comp1').material('mat6').propertyGroup('def').label('Basic');
model.component('comp1').material('mat6').propertyGroup('def').func('int1').label('Interpolation 1');
model.component('comp1').material('mat6').propertyGroup('def').func('int1').set('funcname', 'A_rho');
model.component('comp1').material('mat6').propertyGroup('def').func('int1').set('table', {'0' '-0.5031';  ...
'5' '-0.4821';  ...
'10' '-0.5026';  ...
'15' '-0.482';  ...
'20' '-0.4824';  ...
'25' '-0.4931';  ...
'30' '-0.4812';  ...
'35' '-0.4918';  ...
'40' '-0.4863';  ...
'45' '-0.4912';  ...
'50' '-0.4756';  ...
'55' '-0.4898';  ...
'60' '-0.4916';  ...
'65' '-0.4906';  ...
'70' '-0.4876';  ...
'80' '-0.4942';  ...
'90' '-0.5021';  ...
'100' '-0.501';  ...
'150' '-0.5206';  ...
'200' '-0.5538'});
model.component('comp1').material('mat6').propertyGroup('def').func('int1').set('fununit', {'1'});
model.component('comp1').material('mat6').propertyGroup('def').func('int1').set('argunit', {'1'});
model.component('comp1').material('mat6').propertyGroup('def').func('int2').label('Interpolation 2');
model.component('comp1').material('mat6').propertyGroup('def').func('int2').set('funcname', 'B_rho');
model.component('comp1').material('mat6').propertyGroup('def').func('int2').set('table', {'0' '45.876';  ...
'5' '45.648';  ...
'10' '45.889';  ...
'15' '45.659';  ...
'20' '45.649';  ...
'25' '45.761';  ...
'30' '45.568';  ...
'35' '45.698';  ...
'40' '45.601';  ...
'45' '45.62';  ...
'50' '45.336';  ...
'55' '45.543';  ...
'60' '45.53';  ...
'65' '45.45';  ...
'70' '45.396';  ...
'80' '45.409';  ...
'90' '45.432';  ...
'100' '45.361';  ...
'150' '45.217';  ...
'200' '45.173'});
model.component('comp1').material('mat6').propertyGroup('def').func('int2').set('fununit', {'1'});
model.component('comp1').material('mat6').propertyGroup('def').func('int2').set('argunit', {'1'});
model.component('comp1').material('mat6').propertyGroup('def').func('int3').label('Interpolation 3');
model.component('comp1').material('mat6').propertyGroup('def').func('int3').set('funcname', 'C_rho');
model.component('comp1').material('mat6').propertyGroup('def').func('int3').set('table', {'0' '1004.4';  ...
'5' '1003.8';  ...
'10' '1002.5';  ...
'15' '1002';  ...
'20' '1001';  ...
'25' '999.63';  ...
'30' '998.66';  ...
'35' '996.7';  ...
'40' '994.89';  ...
'45' '992.84';  ...
'50' '991.51';  ...
'55' '988.4';  ...
'60' '985.91';  ...
'65' '983.39';  ...
'70' '980.71';  ...
'80' '974.59';  ...
'90' '967.98';  ...
'100' '960.99';  ...
'150' '919.52';  ...
'200' '869.35'});
model.component('comp1').material('mat6').propertyGroup('def').func('int3').set('fununit', {'1'});
model.component('comp1').material('mat6').propertyGroup('def').func('int3').set('argunit', {'1'});
model.component('comp1').material('mat6').propertyGroup('def').set('diffusion', {'3.75e-9[m^2/s]' '0' '0' '0' '3.75e-9[m^2/s]' '0' '0' '0' '3.75e-9[m^2/s]'});
model.component('comp1').material('mat6').propertyGroup('def').set('INFO_PREFIX:diffusion', ['B. Paxton and J. Newman,  J. Electrochem. Soc., vol. 144, no. 11, (1997) 3818' native2unicode(hex2dec({'20' '13'}), 'unicode') '3831, ']);
model.component('comp1').material('mat6').propertyGroup('def').set('T_reg', 'min(max(T,0[degC]),200[degC])');
model.component('comp1').material('mat6').propertyGroup('def').descr('T_reg', '');
model.component('comp1').material('mat6').propertyGroup('def').set('M_reg', 'min(max(c,1e-6[M]),12[M])/1[M]');
model.component('comp1').material('mat6').propertyGroup('def').descr('M_reg', '');
model.component('comp1').material('mat6').propertyGroup('def').set('density', '(A_rho(T_degC)*M_reg^2+B_rho(T_degC)*M_reg+C_rho(T_degC))*1[kg/m^3]');
model.component('comp1').material('mat6').propertyGroup('def').set('INFO_PREFIX:density', ['R.J. Gilliama, J.W. Graydonb, D.W. Kirkb, S.J. Thorpea, Int. J. Hydrogen Energy 32 (2007) 359 ' native2unicode(hex2dec({'20' '13'}), 'unicode') ' 364']);
model.component('comp1').material('mat6').propertyGroup('def').set('T_degC', '(T_reg-0[degC])/1[K]');
model.component('comp1').material('mat6').propertyGroup('def').descr('T_degC', '');
model.component('comp1').material('mat6').propertyGroup('def').addInput('concentration');
model.component('comp1').material('mat6').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').label('Electrolyte conductivity');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('sigmal', {'(A*M+B*M^2+C*M*T_K+D*M/T_K+E*M^3+F*M^2*T_K^2)*1[S/cm]' '0' '0' '0' '(A*M+B*M^2+C*M*T_K+D*M/T_K+E*M^3+F*M^2*T_K^2)*1[S/cm]' '0' '0' '0' '(A*M+B*M^2+C*M*T_K+D*M/T_K+E*M^3+F*M^2*T_K^2)*1[S/cm]'});
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('INFO_PREFIX:sigmal', ['R.J. Gilliama, J.W. Graydonb, D.W. Kirkb, S.J. Thorpea, Int. J. Hydrogen Energy 32 (2007) 359 ' native2unicode(hex2dec({'20' '13'}), 'unicode') ' 364']);
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('T_K', 'def.T_reg/1[K]');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').descr('T_K', '');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('M', 'def.M_reg');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').descr('M', '');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('A', '-2.041');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').descr('A', '');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('B', '-0.0028');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').descr('B', '');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('C', '0.005332');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').descr('C', '');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('D', '207.2');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').descr('D', '');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('E', '0.001043');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').descr('E', '');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').set('F', '-0.0000003');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').descr('F', '');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').addInput('concentration');
model.component('comp1').material('mat6').propertyGroup('ElectrolyteConductivity').addInput('temperature');
model.component('comp1').material('mat6').propertyGroup('SpeciesProperties').label('Species properties');
model.component('comp1').material('mat6').propertyGroup('SpeciesProperties').set('transpNum', '0.22');
model.component('comp1').material('mat6').propertyGroup('SpeciesProperties').set('INFO_PREFIX:transpNum', ['B. Paxton and J. Newman,  J. Electrochem. Soc., vol. 144, no. 11, (1997) 3818' native2unicode(hex2dec({'20' '13'}), 'unicode') '3831, ']);
model.component('comp1').material('mat6').propertyGroup('SpeciesProperties').set('fcl', '2');
model.component('comp1').material('mat6').propertyGroup('SpeciesProperties').set('INFO_PREFIX:fcl', ['B. Paxton and J. Newman,  J. Electrochem. Soc., vol. 144, no. 11, (1997) 3818' native2unicode(hex2dec({'20' '13'}), 'unicode') '3831, ']);
model.component('comp1').material('mat2').active(false);
model.component('comp1').material('mat1').active(false);
model.component('comp1').material('mat6').selection.set([2]);
model.component('comp1').material.create('effmat1', 'Effective');
model.component('comp1').material.remove('effmat1');

model.component('comp1').geom('geom1').run('r3');

model.component('comp1').material.remove('mat2');
model.component('comp1').material.remove('mat1');

model.component('comp1').geom('geom1').run('r4');
model.component('comp1').geom('geom1').run('r5');
model.component('comp1').geom('geom1').run('fin');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').physics('cd').feature('pce1').selection.set([1 3 7 8 9 10 11 12]);
model.component('comp1').physics('cd').feature('pce1').selection.all;
model.component('comp1').physics('cd').feature('pce1').selection.set([3 4 5 6 7 8 9 10 11 12]);
model.component('comp1').physics('cd').feature('pot1').selection.set([]);
model.component('comp1').physics('cd').feature('egnd1').selection.set([]);
model.component('comp1').physics('cd').feature('pot1').selection.all;
model.component('comp1').physics('cd').feature('pot1').selection.set([3]);
model.component('comp1').physics('cd').feature('pce1').selection.set([1 3 4 5 6 7 8 9 10 11 12]);
model.component('comp1').physics('cd').feature('egnd1').selection.set([9 12 15 18 21 24 27 30 33 36]);

model.material('mat4').propertyGroup('def').set('electricconductivity', {'3.8[S/m]'});
model.material('mat5').propertyGroup('def').set('electricconductivity', {'1000[S/m]'});

model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').feature('ptgr1').selection.all;
model.result('pg9').feature('ptgr1').selection.set([6 8 10 12 14 16 18 20 22 24 26]);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').physics('cd').feature('pce1').feature('pdl1').set('Cdl', '1000[F/m^2]');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'32.4[S/m]'});
model.component('comp1').material.create('mat7', 'Common');
model.component('comp1').material('mat7').propertyGroup.create('ElectrodePotential', 'Equilibrium potential');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func.create('int1', 'Interpolation');
model.component('comp1').material('mat7').propertyGroup.create('OperationalSOC', 'Operational electrode state of charge');
model.component('comp1').material('mat7').propertyGroup.create('EquilibriumConcentration', 'Equilibrium concentration');
model.component('comp1').material('mat7').label('Hard Carbon (Negative, Li-ion Battery)');
model.component('comp1').material('mat7').comments(['vs Li/Li+, T=25 C' newline 'Eeq for fully lithiated at 0.79' newline 'Eeq for delithiated at 0.02' newline  newline 'Reference' newline 'D. P Karthikeyan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermodynamic model development for lithium intercalation electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources, vol. 185, p. 1398, 2008.' newline ]);
model.component('comp1').material('mat7').propertyGroup('def').label('Basic');
model.component('comp1').material('mat7').propertyGroup('def').set('diffusion', {'3.9e-14[m^2/s]' '0' '0' '0' '3.9e-14[m^2/s]' '0' '0' '0' '3.9e-14[m^2/s]'});
model.component('comp1').material('mat7').propertyGroup('def').set('electricconductivity', {'100[S/m]' '0' '0' '0' '100[S/m]' '0' '0' '0' '100[S/m]'});
model.component('comp1').material('mat7').propertyGroup('def').set('density', '2260[kg/m^3]');
model.component('comp1').material('mat7').propertyGroup('def').set('csmax', '30550[mol/m^3]');
model.component('comp1').material('mat7').propertyGroup('def').descr('csmax', '');
model.component('comp1').material('mat7').propertyGroup('def').addInput('concentration');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').label('Equilibrium potential');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').label('Interpolation 1');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('funcname', 'Eeq_int1');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('table', {'0.0210' '0.7144';  ...
'0.0356' '0.6297';  ...
'0.0501' '0.5851';  ...
'0.0703' '0.5540';  ...
'0.0935' '0.5228';  ...
'0.1050' '0.5051';  ...
'0.1223' '0.4873';  ...
'0.1368' '0.4650';  ...
'0.1541' '0.4518';  ...
'0.1714' '0.4295';  ...
'0.1887' '0.4162';  ...
'0.2032' '0.3940';  ...
'0.2176' '0.3761';  ...
'0.2349' '0.3585';  ...
'0.2522' '0.3452';  ...
'0.2811' '0.3096';  ...
'0.2984' '0.2963';  ...
'0.3129' '0.2785';  ...
'0.3302' '0.2608';  ...
'0.3446' '0.2475';  ...
'0.3648' '0.2342';  ...
'0.3792' '0.2209';  ...
'0.3965' '0.2076';  ...
'0.4110' '0.1943';  ...
'0.4283' '0.1810';  ...
'0.4426' '0.1676';  ...
'0.4571' '0.1588';  ...
'0.4773' '0.1500';  ...
'0.4917' '0.1367';  ...
'0.5119' '0.1279';  ...
'0.5263' '0.1190';  ...
'0.5407' '0.1102';  ...
'0.5580' '0.0969';  ...
'0.5753' '0.0880';  ...
'0.5897' '0.0836';  ...
'0.6040' '0.0748';  ...
'0.6214' '0.0660';  ...
'0.6358' '0.0616';  ...
'0.6531' '0.0572';  ...
'0.6703' '0.0528';  ...
'0.6848' '0.0485';  ...
'0.7020' '0.0484';  ...
'0.7193' '0.0442';  ...
'0.7337' '0.0398';  ...
'0.7510' '0.0397';  ...
'0.7682' '0.0355';  ...
'0.7826' '0.0318';  ...
'0.7913' '0.0310'});
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('extrap', 'linear');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('fununit', {'V'});
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('argunit', {'1'});
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('defineinv', true);
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('funcinvname', 'Eeq_inv');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('Eeq', 'Eeq_int1(soc)');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('INFO_PREFIX:Eeq', ['D. P Karthikeyan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermodynamic model development for lithium intercalation electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources, vol. 185, p. 1398, 2008.']);
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('dEeqdT', '0[V/K]');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('cEeqref', 'def.csmax');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('soc', 'c/cEeqref');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').descr('soc', '');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').addInput('concentration');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').label('Operational electrode state of charge');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('socmax', 'elpot.Eeq_inv(E_min)');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('socmin', 'elpot.Eeq_inv(E_max)');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('E_max', '0.7[V]');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('E_min', '0.05[V]');
model.component('comp1').material('mat7').propertyGroup('EquilibriumConcentration').label('Equilibrium concentration');
model.component('comp1').material('mat7').propertyGroup('EquilibriumConcentration').set('csEq', 'def.csmax*elpot.Eeq_inv(V)');
model.component('comp1').material('mat7').propertyGroup('EquilibriumConcentration').addInput('electricpotential');
model.component('comp1').material('mat7').selection.set([1]);
model.component('comp1').material.remove('mat7');
model.component('comp1').material('mat3').propertyGroup('ElectrolyteConductivity').set('sigmal', {'100[S/m]'});

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.material('mat5').propertyGroup.create('ElectrolyteConductivity', 'Electrolyte_conductivity');
model.material('mat5').propertyGroup('ElectrolyteConductivity').set('sigmal', {'100[S/m]'});

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').material.create('mat7', 'Common');
model.component('comp1').material('mat7').propertyGroup('def').func.create('int1', 'Interpolation');
model.component('comp1').material('mat7').propertyGroup('def').func.create('int2', 'Interpolation');
model.component('comp1').material('mat7').propertyGroup.create('ElectrodePotential', 'Equilibrium potential');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func.create('int1', 'Interpolation');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func.create('int2', 'Interpolation');
model.component('comp1').material('mat7').propertyGroup.create('OperationalSOC', 'Operational electrode state of charge');
model.component('comp1').material('mat7').propertyGroup.create('ic', 'Intercalation strain');
model.component('comp1').material('mat7').propertyGroup('ic').func.create('int1', 'Interpolation');
model.component('comp1').material('mat7').propertyGroup.create('EquilibriumConcentration', 'Equilibrium concentration');
model.component('comp1').material('mat7').label('Graphite, LixC6 MCMB (Negative, Li-ion Battery)');
model.component('comp1').material('mat7').propertyGroup('def').label('Basic');
model.component('comp1').material('mat7').propertyGroup('def').func('int1').label('Interpolation 1');
model.component('comp1').material('mat7').propertyGroup('def').func('int1').set('funcname', 'E_int');
model.component('comp1').material('mat7').propertyGroup('def').func('int1').set('table', {'0' '32.47'; '0.333' '28.56'; '0.5' '58.06'; '1' '108.67'});
model.component('comp1').material('mat7').propertyGroup('def').func('int1').set('fununit', {'GPa'});
model.component('comp1').material('mat7').propertyGroup('def').func('int1').set('argunit', {'1'});
model.component('comp1').material('mat7').propertyGroup('def').func('int2').label('Interpolation 2');
model.component('comp1').material('mat7').propertyGroup('def').func('int2').set('funcname', 'nu_int');
model.component('comp1').material('mat7').propertyGroup('def').func('int2').set('table', {'0' '0.32'; '0.333' '0.39'; '0.5' '0.34'; '1' '0.24'});
model.component('comp1').material('mat7').propertyGroup('def').func('int2').set('fununit', {''});
model.component('comp1').material('mat7').propertyGroup('def').set('youngsmodulus', '');
model.component('comp1').material('mat7').propertyGroup('def').set('poissonsratio', '');
model.component('comp1').material('mat7').propertyGroup('def').set('youngsmodulus', 'E_int(c/csmax)');
model.component('comp1').material('mat7').propertyGroup('def').set('INFO_PREFIX:youngsmodulus', 'Yue Qi et al 2010 J. Electrochem. Soc. 157 A558');
model.component('comp1').material('mat7').propertyGroup('def').set('poissonsratio', 'nu_int(c/csmax)');
model.component('comp1').material('mat7').propertyGroup('def').set('INFO_PREFIX:poissonsratio', 'Yue Qi et al 2010 J. Electrochem. Soc. 157 A558');
model.component('comp1').material('mat7').propertyGroup('def').set('electricconductivity', {'100[S/m]' '0' '0' '0' '100[S/m]' '0' '0' '0' '100[S/m]'});
model.component('comp1').material('mat7').propertyGroup('def').set('INFO_PREFIX:electricconductivity', ['V. Srinivasan, and J. Newman, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Design and Optimization of a Natural Graphite/Iron Phosphate Lithium Ion Cell,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Electrochem. Soc., vol. 151, p. 1530, 2004.']);
model.component('comp1').material('mat7').propertyGroup('def').set('diffusion', {'1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1.4523e-13*exp(68025.7/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]'});
model.component('comp1').material('mat7').propertyGroup('def').set('INFO_PREFIX:diffusion', ['K. Kumaresan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermal Model for a Li-Ion Cell,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Electrochem. Soc., vol. 155, p. A164, 2008.']);
model.component('comp1').material('mat7').propertyGroup('def').set('thermalconductivity', {'1[W/(m*K)]' '0' '0' '0' '1[W/(m*K)]' '0' '0' '0' '1[W/(m*K)]'});
model.component('comp1').material('mat7').propertyGroup('def').set('INFO_PREFIX:thermalconductivity', 'S. Chen, C. Wan, and Y. Wang, J. Power Sources, 140, 111 (2005).');
model.component('comp1').material('mat7').propertyGroup('def').set('heatcapacity', '750[J/(kg*K)]');
model.component('comp1').material('mat7').propertyGroup('def').set('INFO_PREFIX:heatcapacity', 'SI Chemical Data, John Wiley & Sons, 1994');
model.component('comp1').material('mat7').propertyGroup('def').set('density', '2300[kg/m^3]');
model.component('comp1').material('mat7').propertyGroup('def').set('INFO_PREFIX:density', 'SI Chemical Data, John Wiley & Sons, 1994');
model.component('comp1').material('mat7').propertyGroup('def').set('csmax', '31507[mol/m^3]');
model.component('comp1').material('mat7').propertyGroup('def').descr('csmax', '');
model.component('comp1').material('mat7').propertyGroup('def').set('T_ref', '318[K]');
model.component('comp1').material('mat7').propertyGroup('def').descr('T_ref', '');
model.component('comp1').material('mat7').propertyGroup('def').set('T2', 'min(393.15,max(T,223.15))');
model.component('comp1').material('mat7').propertyGroup('def').descr('T2', '');
model.component('comp1').material('mat7').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat7').propertyGroup('def').addInput('concentration');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').label('Equilibrium potential');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').label('Interpolation 1');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('funcname', 'Eeq_int1');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('table', {'0' '2.781186612';  ...
'0.01' '1.520893224';  ...
'0.02' '0.893922607';  ...
'0.03' '0.581284406';  ...
'0.04' '0.42452844';  ...
'0.05' '0.344895805';  ...
'0.06' '0.303146342';  ...
'0.07' '0.279578072';  ...
'0.08' '0.264093089';  ...
'0.09' '0.251347845';  ...
'0.1' '0.238588379';  ...
'0.11' '0.224803164';  ...
'0.12' '0.210294358';  ...
'0.13' '0.196408586';  ...
'0.14' '0.184624188';  ...
'0.15' '0.175188157';  ...
'0.16' '0.167373311';  ...
'0.17' '0.160452107';  ...
'0.18' '0.154025412';  ...
'0.19' '0.147948522';  ...
'0.2' '0.142214997';  ...
'0.21' '0.13688271';  ...
'0.22' '0.132033114';  ...
'0.23' '0.127747573';  ...
'0.24' '0.124091616';  ...
'0.25' '0.121103387';  ...
'0.26' '0.11878567';  ...
'0.27' '0.117102317';  ...
'0.28' '0.115980205';  ...
'0.29' '0.115317054';  ...
'0.3' '0.114993965';  ...
'0.31' '0.114890105';  ...
'0.32' '0.114886278';  ...
'0.33' '0.114884619';  ...
'0.34' '0.114873068';  ...
'0.35' '0.114824904';  ...
'0.36' '0.114644725';  ...
'0.37' '0.114372614';  ...
'0.38' '0.114017954';  ...
'0.39' '0.11359371';  ...
'0.4' '0.11311133';  ...
'0.41' '0.112575849';  ...
'0.42' '0.111980245';  ...
'0.43' '0.111297682';  ...
'0.44' '0.110470149';  ...
'0.45' '0.109393081';  ...
'0.46' '0.107900592';  ...
'0.47' '0.10576964';  ...
'0.48' '0.102783317';  ...
'0.49' '0.09889031';  ...
'0.5' '0.094391564';  ...
'0.51' '0.089921069';  ...
'0.52' '0.086112415';  ...
'0.53' '0.083265315';  ...
'0.54' '0.081326247';  ...
'0.55' '0.080074892';  ...
'0.56' '0.07928329';  ...
'0.57' '0.078778765';  ...
'0.58' '0.078447703';  ...
'0.59' '0.078220432';  ...
'0.6' '0.078055641';  ...
'0.61' '0.077929111';  ...
'0.62' '0.077826563';  ...
'0.63' '0.077739397';  ...
'0.64' '0.077662227';  ...
'0.65' '0.077591472';  ...
'0.66' '0.077524557';  ...
'0.67' '0.077459463';  ...
'0.68' '0.077394455';  ...
'0.69' '0.077327934';  ...
'0.7' '0.077258337';  ...
'0.71' '0.077184077';  ...
'0.72' '0.077103499';  ...
'0.73' '0.077014851';  ...
'0.74' '0.076916258';  ...
'0.75' '0.07680571';  ...
'0.76' '0.07668104';  ...
'0.77' '0.07653992';  ...
'0.78' '0.076379839';  ...
'0.79' '0.076198086';  ...
'0.8' '0.075991699';  ...
'0.81' '0.075757371';  ...
'0.82' '0.075491288';  ...
'0.83' '0.075188813';  ...
'0.84' '0.07484398';  ...
'0.85' '0.074448647';  ...
'0.86' '0.07399118';  ...
'0.87' '0.073454466';  ...
'0.88' '0.072812991';  ...
'0.89' '0.072028722';  ...
'0.9' '0.071045433';  ...
'0.91' '0.069780996';  ...
'0.92' '0.068116222';  ...
'0.93' '0.065874599';  ...
'0.94' '0.062770873';  ...
'0.95' '0.058253898';  ...
'0.96' '0.051075794';  ...
'0.97' '0.038790069';  ...
'0.98' '0.020172191'});
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('extrap', 'linear');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('fununit', {'V'});
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('argunit', {''});
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('defineinv', true);
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int1').set('funcinvname', 'Eeq_inv');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int2').label('Interpolation 2');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int2').set('funcname', 'dEeqdT_int1');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int2').set('table', {'0' '3.0e-4';  ...
'0.17' '0';  ...
'0.24' '-6e-5';  ...
'0.28' '-1.6e-4';  ...
'0.5' '-1.6e-4';  ...
'0.54' '-9e-5';  ...
'0.71' '-9e-5';  ...
'0.85' '-1.0e-4';  ...
'1.0' '-1.2e-4'});
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int2').set('fununit', {'V/K'});
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').func('int2').set('argunit', {''});
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('Eeq', 'Eeq_int1(soc)+dEeqdT_int1(soc)*(T-298[K])');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('INFO_PREFIX:Eeq', ['D. P Karthikeyan, G. Sikha, and R. E. White, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Thermodynamic model development for lithium intercalation electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources, vol. 185, p. 1398, 2008.']);
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('dEeqdT', 'dEeqdT_int1(soc)');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('INFO_PREFIX:dEeqdT', ['K. E. Thomas, and J. Newman, ' native2unicode(hex2dec({'20' '1c'}), 'unicode') 'Heats of mixing and of entropy in porous insertion electrodes,' native2unicode(hex2dec({'20' '1d'}), 'unicode') ' J. Power Sources., vol. 119-121, p. 844, 2003.']);
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('cEeqref', 'def.csmax');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').set('soc', 'c/cEeqref');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').descr('soc', '');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').addInput('concentration');
model.component('comp1').material('mat7').propertyGroup('ElectrodePotential').addInput('temperature');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').label('Operational electrode state of charge');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('socmax', 'elpot.Eeq_inv(E_min)');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('socmin', 'elpot.Eeq_inv(E_max)');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('E_max', '1[V]');
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('E_min', '0.075[V]');
model.component('comp1').material('mat7').propertyGroup('ic').label('Intercalation strain');
model.component('comp1').material('mat7').propertyGroup('ic').func('int1').label('Interpolation 1');
model.component('comp1').material('mat7').propertyGroup('ic').func('int1').set('funcname', 'dVOLdSOL');
model.component('comp1').material('mat7').propertyGroup('ic').func('int1').set('table', {'0' '0';  ...
'0.006802721088435382' '0.12500000000000178';  ...
'0.06316812439261421' '1.2736486486486491';  ...
'0.11175898931000966' '2.523648648648649';  ...
'0.17978620019436342' '3.5709459459459474';  ...
'0.2400388726919339' '4.449324324324325';  ...
'0.2905733722060252' '5.192567567567568';  ...
'0.3566569484936831' '5.66554054054054';  ...
'0.4188532555879494' '5.969594594594595';  ...
'0.48104956268221566' '6.10472972972973';  ...
'0.5432458697764819' '6.173648648648647';  ...
'0.58600583090379' '6.306081081081081';  ...
'0.6112730806608356' '7.726351351351352';  ...
'0.6443148688046647' '8.570945945945946';  ...
'0.694849368318756' '9.449324324324323';  ...
'0.7414965986394557' '10.29391891891892';  ...
'0.7764820213799805' '10.902027027027025';  ...
'0.8231292517006802' '11.543918918918918';  ...
'0.8542274052478133' '12.152027027027026';  ...
'0.8833819241982507' '12.827702702702702';  ...
'0.9183673469387755' '12.996621621621621';  ...
'0.9494655004859086' '13.16554054054054'});
model.component('comp1').material('mat7').propertyGroup('ic').func('int1').set('extrap', 'linear');
model.component('comp1').material('mat7').propertyGroup('ic').func('int1').set('fununit', {'%'});
model.component('comp1').material('mat7').propertyGroup('ic').func('int1').set('argunit', {'1'});
model.component('comp1').material('mat7').propertyGroup('ic').set('dvol', 'dVOLdSOL(c/def.csmax)');
model.component('comp1').material('mat7').propertyGroup('ic').set('INFO_PREFIX:dvol', ['S. Schweidler, L. de Biasi, A. Schiele, P. Hartmann, T. Brezesinski and J. Janek, "Volume Changes of Graphite Anodes Revisited: A Combined Operando X-Ray Diffraction and In Situ Pressure Analysis Study", J. Phys. Chem. C, 2018, 122, 8829' native2unicode(hex2dec({'20' '13'}), 'unicode') '8835']);
model.component('comp1').material('mat7').propertyGroup('ic').addInput('concentration');
model.component('comp1').material('mat7').propertyGroup('EquilibriumConcentration').label('Equilibrium concentration');
model.component('comp1').material('mat7').propertyGroup('EquilibriumConcentration').set('csEq', 'def.csmax*elpot.Eeq_inv(V)');
model.component('comp1').material('mat7').propertyGroup('EquilibriumConcentration').addInput('electricpotential');
model.component('comp1').material('mat7').selection.set([12]);
model.component('comp1').material('mat7').propertyGroup.create('ElectrolyteConductivity', 'Electrolyte_conductivity');
model.component('comp1').material('mat7').propertyGroup('ElectrolyteConductivity').set('sigmal', {'100[S/m]'});

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').material('mat7').selection.set([4 6 8 10 12]);
model.component('comp1').material.create('mat8', 'Common');
model.component('comp1').material('mat8').propertyGroup.create('ElectrodePotential', 'Equilibrium potential');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func.create('int1', 'Interpolation');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func.create('int2', 'Interpolation');
model.component('comp1').material('mat8').propertyGroup.create('OperationalSOC', 'Operational electrode state of charge');
model.component('comp1').material('mat8').propertyGroup.create('EquilibriumConcentration', 'Equilibrium concentration');
model.component('comp1').material('mat8').propertyGroup.create('ElectrolyteConductivity', [native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'fc'}), 'unicode')  native2unicode(hex2dec({'73' '87'}), 'unicode') ]);
model.component('comp1').material('mat8').label('ZnMnO4');
model.component('comp1').material('mat8').propertyGroup('def').label('Basic');
model.component('comp1').material('mat8').propertyGroup('def').set('youngsmodulus', '');
model.component('comp1').material('mat8').propertyGroup('def').set('poissonsratio', '');
model.component('comp1').material('mat8').propertyGroup('def').set('youngsmodulus', '194[GPa]');
model.component('comp1').material('mat8').propertyGroup('def').set('INFO_PREFIX:youngsmodulus', 'Yue Qi et al 2014 J. Electrochem. Soc. 161 F3010');
model.component('comp1').material('mat8').propertyGroup('def').set('poissonsratio', '0.26');
model.component('comp1').material('mat8').propertyGroup('def').set('INFO_PREFIX:poissonsratio', 'Yue Qi et al 2014 J. Electrochem. Soc. 161 F3010');
model.component('comp1').material('mat8').propertyGroup('def').set('electricconductivity', {'3e3[S/m]' '0' '0' '0' '3e3[S/m]' '0' '0' '0' '3e3[S/m]'});
model.component('comp1').material('mat8').propertyGroup('def').set('INFO_PREFIX:electricconductivity', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.component('comp1').material('mat8').propertyGroup('def').set('diffusion', {'1e-14*exp(20000/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1e-14*exp(20000/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]' '0' '0' '0' '1e-14*exp(20000/8.314*(1/(T_ref/1[K])-1/(T2/1[K])))[m^2/s]'});
model.component('comp1').material('mat8').propertyGroup('def').set('INFO_PREFIX:diffusion', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.component('comp1').material('mat8').propertyGroup('def').set('density', '1950[kg/m^3]');
model.component('comp1').material('mat8').propertyGroup('def').set('INFO_PREFIX:density', 'N. Nitta, F. Wu, J. Tae Lee, and G. Yushin, Materials Today, Volume 18, Number 5, June 2015');
model.component('comp1').material('mat8').propertyGroup('def').set('T_ref', '298[K]');
model.component('comp1').material('mat8').propertyGroup('def').descr('T_ref', '');
model.component('comp1').material('mat8').propertyGroup('def').set('T2', 'min(393.15,max(T,223.15))');
model.component('comp1').material('mat8').propertyGroup('def').descr('T2', '');
model.component('comp1').material('mat8').propertyGroup('def').set('csmax', '22860[mol/m^3]');
model.component('comp1').material('mat8').propertyGroup('def').descr('csmax', '');
model.component('comp1').material('mat8').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat8').propertyGroup('def').set('heatcapacity', '710[J/(kg*K)]');
model.component('comp1').material('mat8').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat8').propertyGroup('def').set('emissivity', '1');
model.component('comp1').material('mat8').propertyGroup('def').set('thermalconductivity', {'150[W/(m*K)]*(300[K]/T)' '0' '0' '0' '150[W/(m*K)]*(300[K]/T)' '0' '0' '0' '150[W/(m*K)]*(300[K]/T)'});
model.component('comp1').material('mat8').propertyGroup('def').addInput('temperature');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').label('Equilibrium potential');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int1').label('Interpolation 1');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int1').set('funcname', 'Eeq_int1');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int1').set('table', {'0.1750' '4.2763';  ...
'0.1950' '4.1898';  ...
'0.2150' '4.1507';  ...
'0.2350' '4.133';  ...
'0.2550' '4.1248';  ...
'0.2750' '4.1209';  ...
'0.2950' '4.119';  ...
'0.3150' '4.1179';  ...
'0.3350' '4.1171';  ...
'0.3550' '4.1165';  ...
'0.3750' '4.116';  ...
'0.3950' '4.1153';  ...
'0.4150' '4.1145';  ...
'0.4350' '4.1135';  ...
'0.4550' '4.1121';  ...
'0.4750' '4.1099';  ...
'0.4950' '4.1066';  ...
'0.5150' '4.1014';  ...
'0.5350' '4.0934';  ...
'0.5550' '4.082';  ...
'0.5750' '4.067';  ...
'0.5950' '4.05';  ...
'0.6150' '4.0333';  ...
'0.6350' '4.0192';  ...
'0.6550' '4.0087';  ...
'0.6750' '4.0012';  ...
'0.6950' '3.996';  ...
'0.7150' '3.9923';  ...
'0.7350' '3.9893';  ...
'0.7550' '3.9867';  ...
'0.7750' '3.9841';  ...
'0.7950' '3.9813';  ...
'0.8150' '3.9783';  ...
'0.8350' '3.9747';  ...
'0.8550' '3.9705';  ...
'0.8750' '3.9652';  ...
'0.8950' '3.9585';  ...
'0.9150' '3.9493';  ...
'0.9350' '3.9361';  ...
'0.9550' '3.9144';  ...
'0.9750' '3.869';  ...
'0.9950' '3.5944';  ...
'' ''});
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int1').set('interp', 'piecewisecubic');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int1').set('extrap', 'linear');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int1').set('fununit', {'V'});
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int1').set('argunit', {''});
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int1').set('defineinv', true);
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int1').set('funcinvname', 'Eeq_inv');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int2').label('Interpolation 2');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int2').set('funcname', 'dEeqdT_int1');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int2').set('table', {'0.15' '0.15e-3';  ...
'0.18' '0.25e-3';  ...
'0.20' '0.21e-3';  ...
'0.209' '0.19e-3';  ...
'0.26' '0.175e-3';  ...
'0.28' '0.166e-3';  ...
'0.30' '0.155e-3';  ...
'0.35' '0.11e-3';  ...
'0.394' '0.095e-3';  ...
'0.41' '0.05e-3';  ...
'0.437' '0.02e-3';  ...
'0.445' '0';  ...
'0.46' '-0.048e-3';  ...
'0.48' '-0.15e-3';  ...
'0.50' '-0.255e-3';  ...
'0.515' '-0.3e-3';  ...
'0.545' '-0.3e-3';  ...
'0.553' '-0.22e-3';  ...
'0.58' '-0.145e-3';  ...
'0.592' '-0.10e-3';  ...
'0.60' '0';  ...
'0.62' '0.08e-3';  ...
'0.64' '0.12e-3';  ...
'0.70' '0.124e-3';  ...
'0.72' '0.10e-3';  ...
'0.73' '0.05e-3';  ...
'0.76' '0';  ...
'0.78' '-0.057e-3';  ...
'0.81' '-0.08e-3';  ...
'0.86' '-0.10e-3';  ...
'0.91' '-0.16e-3';  ...
'0.96' '-0.22e-3';  ...
'0.98' '-0.30e-3'});
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int2').set('interp', 'piecewisecubic');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int2').set('fununit', {'V/K'});
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').func('int2').set('argunit', {''});
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').set('Eeq', 'Eeq_int1(soc)+dEeqdT_int1(soc)*(T-298[K])');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').set('INFO_PREFIX:Eeq', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').set('dEeqdT', 'dEeqdT_int1(soc)');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').set('INFO_PREFIX:dEeqdT', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').set('cEeqref', 'def.csmax');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').set('INFO_PREFIX:cEeqref', 'V. Srinivasan and C.Y. Wang, "Analysis of Electrochemical and Thermal Behavior of Li-Ion Cells," J. Electrochem. Soc., vol. 150, p. A98, 2003');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').set('soc', 'c/cEeqref');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').descr('soc', '');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').addInput('concentration');
model.component('comp1').material('mat8').propertyGroup('ElectrodePotential').addInput('temperature');
model.component('comp1').material('mat8').propertyGroup('OperationalSOC').label('Operational electrode state of charge');
model.component('comp1').material('mat8').propertyGroup('OperationalSOC').set('socmax', 'elpot.Eeq_inv(E_min)');
model.component('comp1').material('mat8').propertyGroup('OperationalSOC').set('socmin', 'elpot.Eeq_inv(E_max)');
model.component('comp1').material('mat8').propertyGroup('OperationalSOC').set('E_max', '4.2[V]');
model.component('comp1').material('mat8').propertyGroup('OperationalSOC').set('E_min', '3.9[V]');
model.component('comp1').material('mat8').propertyGroup('EquilibriumConcentration').label('Equilibrium concentration');
model.component('comp1').material('mat8').propertyGroup('EquilibriumConcentration').set('csEq', 'def.csmax*elpot.Eeq_inv(V)');
model.component('comp1').material('mat8').propertyGroup('EquilibriumConcentration').addInput('electricpotential');
model.component('comp1').material('mat8').propertyGroup('ElectrolyteConductivity').set('sigmal', {'2[S/m]' '0' '0' '0' '2[S/m]' '0' '0' '0' '2[S/m]'});
model.component('comp1').material('mat8').selection.set([3 5 7 9 11]);
model.material.remove('mat5');
model.material.remove('mat4');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;

model.param.set('V_max', '1.6[V]');
model.param.set('v', '0.05[V/s]');

model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').mesh('mesh1').run;
model.component('comp1').mesh('mesh1').run;

model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').set('xlabelactive', true);
model.result('pg9').set('ylabelactive', true);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg8').run;
model.result('pg9').run;
model.result.export.create('anim1', 'Animation');
model.result.export('anim1').set('target', 'player');
model.result.export('anim1').set('plotgroup', 'pg9');
model.result.export('anim1').run;
model.result.export('anim1').showFrame;
model.result.export('anim1').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg2').setIndex('looplevel', 12, 0);
model.result('pg2').run;
model.result('pg9').run;
model.result('pg9').run;

model.component('comp1').material('mat8').propertyGroup('ElectrolyteConductivity').set('sigmal', {'50[S/m]'});
model.component('comp1').material('mat8').propertyGroup('def').set('electricconductivity', {'3.8[S/m]'});
model.component('comp1').material('mat7').propertyGroup('def').set('electricconductivity', {'1000[S/m]'});
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('E_min', {'0[V]'});
model.component('comp1').material('mat3').propertyGroup('OperationalSOC').set('E_max', {'4.2[V]'});
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('E_min', {'0[V]'});
model.component('comp1').material('mat7').propertyGroup('OperationalSOC').set('E_max', {'4.2[V]'});
model.component('comp1').material('mat8').propertyGroup('OperationalSOC').set('E_min', {'0[V]'});
model.component('comp1').material('mat3').propertyGroup('ElectrolyteConductivity').set('sigmal', {'80[S/m]'});

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').feature('ptgr1').set('data', 'dset1');
model.result('pg9').run;
model.result('pg9').run;

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg8').run;
model.result('pg1').run;
model.result.table.create('evl2', 'Table');
model.result.table('evl2').comments([native2unicode(hex2dec({'4e' 'a4'}), 'unicode')  native2unicode(hex2dec({'4e' '92'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'4e' '8c'}), 'unicode')  native2unicode(hex2dec({'7e' 'f4'}), 'unicode')  native2unicode(hex2dec({'50' '3c'}), 'unicode') ]);
model.result.table('evl2').label('Evaluation 2D');
model.result.table('evl2').addRow([2.800316333770752 9.613924026489258 3.2915488726186826E-6], [0 0 0]);
model.result('pg1').setIndex('looplevel', 5, 0);
model.result('pg1').run;
model.result('pg1').setIndex('looplevel', 1, 0);
model.result('pg9').run;
model.result('pg9').feature('ptgr1').set('xdatadescractive', true);
model.result('pg9').feature('ptgr1').set('descractive', true);
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').feature('ptgr1').selection.set([4 6 8 10 12 14 16 18 20 22 24 26]);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').feature('ptgr1').selection.set([4]);
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r12').active(false);
model.component('comp1').geom('geom1').feature('r11').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').feature('ptgr1').set('legend', true);
model.result('pg9').set('ylog', false);
model.result('pg9').set('xlog', false);

model.component('comp1').geom('geom1').feature('r10').active(false);
model.component('comp1').geom('geom1').feature('r9').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r8').active(false);
model.component('comp1').geom('geom1').feature('r7').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r6').active(false);
model.component('comp1').geom('geom1').feature('r5').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r5').active(true);
model.component('comp1').geom('geom1').feature('r6').active(true);
model.component('comp1').geom('geom1').feature('r7').active(true);
model.component('comp1').geom('geom1').feature('r8').active(true);
model.component('comp1').geom('geom1').feature('r9').active(true);
model.component('comp1').geom('geom1').feature('r10').active(true);
model.component('comp1').geom('geom1').feature('r11').active(true);
model.component('comp1').geom('geom1').feature('r12').active(true);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('fin');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').geom('geom1').feature('r11').active(false);
model.component('comp1').geom('geom1').feature('r12').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').geom('geom1').feature('r11').active(true);
model.component('comp1').geom('geom1').feature('r12').active(true);
model.component('comp1').geom('geom1').run('r12');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('fin');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.component('comp1').material('mat8').selection.set([3 5 7 9 11]);
model.component('comp1').material('mat7').selection.set([4 6 8 10 12]);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').set('showlegends', false);
model.result('pg9').run;

model.label(['[LBL' native2unicode(hex2dec({'53' '47'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode') ']B' native2unicode(hex2dec({'7a' 'd9'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode') '--' native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') ' - ' native2unicode(hex2dec({'52' '6f'}), 'unicode')  native2unicode(hex2dec({'67' '2c'}), 'unicode') '.mph']);

model.component('comp1').physics('cd').feature('pce1').selection.set([1 3 4 5 6 7 8 9 10 11 12]);
model.component('comp1').physics('cd').feature('egnd1').selection.set([9 12 15 21 27 33]);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r12').active(false);
model.component('comp1').geom('geom1').feature('r11').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r11').active(true);
model.component('comp1').geom('geom1').feature('r12').active(true);
model.component('comp1').geom('geom1').run;

model.component('comp1').material('mat8').selection.set([3 5 7 9 11]);
model.component('comp1').material('mat7').selection.set([4 6 8 10 12]);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').run('r12');
model.component('comp1').geom('geom1').create('r13', 'Rectangle');
model.component('comp1').geom('geom1').feature('r13').set('size', [0.5 10]);
model.component('comp1').geom('geom1').feature('r13').set('pos', [5.55 0]);
model.component('comp1').geom('geom1').run('r13');
model.component('comp1').geom('geom1').create('r14', 'Rectangle');
model.component('comp1').geom('geom1').feature('r13').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 13ZMO']);
model.component('comp1').geom('geom1').feature('r14').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 14' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r14').set('pos', [6.05 0]);
model.component('comp1').geom('geom1').feature('r14').set('size', [0.5 10]);
model.component('comp1').geom('geom1').run('r14');
model.component('comp1').geom('geom1').feature('r14').set('size', [0.01 10]);
model.component('comp1').geom('geom1').run('r14');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').mesh('mesh1').run;

model.component('comp1').material('mat8').selection.set([3 5 7 9 11 13]);
model.component('comp1').material('mat7').selection.set([4 6 8 10 12 14]);

model.component('comp1').mesh('mesh1').run;

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') '.mph']);

model.component('comp1').geom('geom1').feature('r4').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 3' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r4').set('pos', [3 0]);
model.component('comp1').geom('geom1').run('r4');
model.component('comp1').geom('geom1').feature('r3').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') '4 ZMO']);
model.component('comp1').geom('geom1').feature.move('r3', 3);
model.component('comp1').geom('geom1').feature('r3').set('pos', [3.01 0]);
model.component('comp1').geom('geom1').run('r3');
model.component('comp1').geom('geom1').feature('r6').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 5' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r6').set('pos', [3.51 0]);
model.component('comp1').geom('geom1').run('r6');
model.component('comp1').geom('geom1').feature('r5').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 6 ZMO']);
model.component('comp1').geom('geom1').feature('r5').set('pos', [3.52 0]);
model.component('comp1').geom('geom1').run('r5');
model.component('comp1').geom('geom1').run('r6');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('r6');
model.component('comp1').geom('geom1').feature.move('r6', 4);
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('r4');
model.component('comp1').geom('geom1').run('r3');
model.component('comp1').geom('geom1').run('r6');
model.component('comp1').geom('geom1').run('r5');
model.component('comp1').geom('geom1').feature.move('r8', 6);
model.component('comp1').geom('geom1').feature('r8').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 7' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r8').set('pos', [4.02 0]);
model.component('comp1').geom('geom1').run('r8');
model.component('comp1').geom('geom1').feature('r7').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 8 ZMO']);
model.component('comp1').geom('geom1').feature('r7').set('pos', [4.03 0]);
model.component('comp1').geom('geom1').run('r7');
model.component('comp1').geom('geom1').feature.move('r9', 9);
model.component('comp1').geom('geom1').feature('r10').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 9 ' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r10').set('pos', [4.52 0]);
model.component('comp1').geom('geom1').run('r10');
model.component('comp1').geom('geom1').feature('r9').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 10 ZMO']);
model.component('comp1').geom('geom1').run('r9');
model.component('comp1').geom('geom1').feature.move('r11', 11);
model.component('comp1').geom('geom1').feature('r12').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 11 ' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r12').set('pos', [5.03 0]);
model.component('comp1').geom('geom1').run('r12');
model.component('comp1').geom('geom1').feature('r11').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 12 ZMO']);
model.component('comp1').geom('geom1').run('r11');
model.component('comp1').geom('geom1').feature.move('r13', 13);
model.component('comp1').geom('geom1').feature('r14').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 13' native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') ]);
model.component('comp1').geom('geom1').feature('r14').set('pos', [5.54 0]);
model.component('comp1').geom('geom1').run('r14');
model.component('comp1').geom('geom1').feature('r13').label([native2unicode(hex2dec({'77' 'e9'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ' 14 ZMO']);
model.component('comp1').geom('geom1').run('r13');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').physics('cd').feature('pce1').selection.set([1 3 4 5 6 7 8 9 10 11 12 13 14]);
model.component('comp1').physics('cd').feature('egnd1').selection.set([9 12 15 18 21 24 27 30 33 36 39 42]);

model.component('comp1').mesh('mesh1').run;

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;
model.result('pg9').run;

model.label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') '.mph']);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg8').run;
model.result('pg9').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r13').active(false);
model.component('comp1').geom('geom1').feature('r14').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r11').active(false);
model.component('comp1').geom('geom1').feature('r12').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r9').active(false);
model.component('comp1').geom('geom1').feature('r10').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r7').active(false);
model.component('comp1').geom('geom1').feature('r8').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r6').active(false);
model.component('comp1').geom('geom1').feature('r5').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.label([native2unicode(hex2dec({'30' '10'}), 'unicode')  native2unicode(hex2dec({'7e' 'b3'}), 'unicode')  native2unicode(hex2dec({'7c' '73'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'30' '11'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') ' - ' native2unicode(hex2dec({'52' '6f'}), 'unicode')  native2unicode(hex2dec({'67' '2c'}), 'unicode') '.mph']);

model.result('pg9').run;

model.component('comp1').geom('geom1').lengthUnit('nm');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').runPre('fin');
model.component('comp1').geom('geom1').run('r1');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').lengthUnit([native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm']);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;

model.label([native2unicode(hex2dec({'30' '10'}), 'unicode')  native2unicode(hex2dec({'7e' 'b3'}), 'unicode')  native2unicode(hex2dec({'7c' '73'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'30' '11'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') ' - ' native2unicode(hex2dec({'52' '6f'}), 'unicode')  native2unicode(hex2dec({'67' '2c'}), 'unicode') '.mph']);

model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('r4');
model.component('comp1').geom('geom1').run('r3');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r6').active(true);
model.component('comp1').geom('geom1').feature('r5').active(true);
model.component('comp1').geom('geom1').run;

model.component('comp1').material('mat7').selection.set([3 5]);
model.component('comp1').material('mat8').selection.set([4 6]);

model.result('pg6').run;

model.component('comp1').physics('cd').feature('pce1').selection.set([1 3 4 5 6]);
model.component('comp1').physics('cd').feature('egnd1').selection.set([9 12 15 18]);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r8').active(true);
model.component('comp1').geom('geom1').feature('r7').active(true);
model.component('comp1').geom('geom1').feature('r10').active(true);
model.component('comp1').geom('geom1').feature('r9').active(true);
model.component('comp1').geom('geom1').feature('r12').active(true);
model.component('comp1').geom('geom1').feature('r11').active(true);
model.component('comp1').geom('geom1').feature('r14').active(true);
model.component('comp1').geom('geom1').feature('r13').active(true);
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('fin');

model.component('comp1').material('mat7').selection.set([3 5 7 9 11 13]);
model.component('comp1').material('mat8').selection.set([4 6 8 10 12 14]);

model.component('comp1').physics('cd').feature('pce1').selection.set([1 3 4 5 6 7 8 9 10 11 12 13 14]);
model.component('comp1').physics('cd').feature('egnd1').selection.set([9 12 15 18 21 24 27 30 33 36 39 42]);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r13').active(false);
model.component('comp1').geom('geom1').feature('r14').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r11').active(false);
model.component('comp1').geom('geom1').feature('r12').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r9').active(false);
model.component('comp1').geom('geom1').feature('r10').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r7').active(false);
model.component('comp1').geom('geom1').feature('r8').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;

model.component('comp1').geom('geom1').feature('r5').active(false);
model.component('comp1').geom('geom1').feature('r6').active(false);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg9').run;
model.result('pg2').run;
model.result('pg3').run;
model.result('pg4').run;
model.result('pg4').setIndex('looplevel', 5, 0);
model.result('pg4').setIndex('looplevel', 1, 0);
model.result('pg7').run;
model.result('pg8').run;

model.component('comp1').geom('geom1').feature('r6').active(true);
model.component('comp1').geom('geom1').feature('r5').active(true);
model.component('comp1').geom('geom1').run('r1');
model.component('comp1').geom('geom1').run('r2');
model.component('comp1').geom('geom1').run('r4');
model.component('comp1').geom('geom1').run('r3');

model.label([native2unicode(hex2dec({'30' '10'}), 'unicode') 'EIS' native2unicode(hex2dec({'5f' 'ae'}), 'unicode')  native2unicode(hex2dec({'7c' '73'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'30' '11'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') '.mph']);

model.component('comp1').geom('geom1').feature('r8').active(true);
model.component('comp1').geom('geom1').feature('r7').active(true);
model.component('comp1').geom('geom1').feature('r10').active(true);
model.component('comp1').geom('geom1').feature('r9').active(true);
model.component('comp1').geom('geom1').run;

model.component('comp1').material('mat8').selection.set([4 6 8 10]);
model.component('comp1').material('mat7').selection.set([3 5 7 9]);

model.component('comp1').physics('cd').feature('pce1').selection.set([1 3 4 5 6 7 8 9 10]);
model.component('comp1').physics('cd').feature('egnd1').selection.set([9 12 15 18 21 24 27 30]);
model.component('comp1').physics('cd').feature('pot1').create('hp1', 'HarmonicPerturbation', 1);
model.component('comp1').physics('cd').feature('pot1').feature('hp1').set('deltaphis', '0.01[V]');
model.component('comp1').physics('cd').feature('pot1').set('phisbnd', 3);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('t1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'time');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scalemethod', 'manual');
model.sol('sol1').feature('v1').feature('comp1_phil').set('scaleval', '1');
model.sol('sol1').feature('v1').feature('comp1_phis').set('scaleval', '1');
model.sol('sol1').feature('v1').set('control', 'time');
model.sol('sol1').create('t1', 'Time');
model.sol('sol1').feature('t1').set('tlist', 'range(0,tH/10,tH*4)');
model.sol('sol1').feature('t1').set('plot', 'off');
model.sol('sol1').feature('t1').set('plotgroup', 'pg1');
model.sol('sol1').feature('t1').set('plotfreq', 'tout');
model.sol('sol1').feature('t1').set('probesel', 'all');
model.sol('sol1').feature('t1').set('probes', {});
model.sol('sol1').feature('t1').set('probefreq', 'tsteps');
model.sol('sol1').feature('t1').set('rtol', 0.001);
model.sol('sol1').feature('t1').set('atolglobalvaluemethod', 'factor');
model.sol('sol1').feature('t1').set('eventout', true);
model.sol('sol1').feature('t1').set('reacf', true);
model.sol('sol1').feature('t1').set('storeudot', true);
model.sol('sol1').feature('t1').set('endtimeinterpolation', true);
model.sol('sol1').feature('t1').set('maxorder', 2);
model.sol('sol1').feature('t1').set('control', 'time');
model.sol('sol1').feature('t1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').create('i1', 'Iterative');
model.sol('sol1').feature('t1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').create('i2', 'Iterative');
model.sol('sol1').feature('t1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('t1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('t1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('t1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('t1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('t1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('t1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('t1').feature.remove('fcDef');
model.sol('sol1').attach('std1');

model.study.remove('std1');
model.study.create('std1');
model.study('std1').create('frlin', 'Frequencylinearized');
model.study('std1').feature('frlin').set('solnum', 'auto');
model.study('std1').feature('frlin').set('notsolnum', 'auto');
model.study('std1').feature('frlin').set('outputmap', {});
model.study('std1').feature('frlin').set('ngenAUX', '1');
model.study('std1').feature('frlin').set('goalngenAUX', '1');
model.study('std1').feature('frlin').set('ngenAUX', '1');
model.study('std1').feature('frlin').set('goalngenAUX', '1');
model.study('std1').feature('frlin').setSolveFor('/physics/cd', true);
model.study('std1').feature('frlin').set('plist', 'range(0.01,100,100000)');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'frlin');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'frlin');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').set('stol', 1.0E-4);
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(0.01,100,100000)'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'no');
model.sol('sol1').feature('s1').feature('p1').set('pdistrib', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'Default');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'frlin');
model.sol('sol1').feature('s1').set('nonlin', 'linper');
model.sol('sol1').feature('s1').set('storelinpoint', true);
model.sol('sol1').feature('s1').set('linpsolnum', 'all');
model.sol('sol1').feature('s1').set('control', 'frlin');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result.create('pg1', 'PlotGroup1D');
model.result('pg1').set('data', 'dset1');
model.result('pg1').create('nyq1', 'Nyquist');
model.result('pg1').feature('nyq1').set('unit', {''});
model.result('pg1').feature('nyq1').set('expr', {'conj(cd.Zvsgrnd_pot1) '});
model.result('pg1').feature('nyq1').set('descr', {''});
model.result('pg1').label([native2unicode(hex2dec({'5b' 'f9'}), 'unicode')  native2unicode(hex2dec({'57' '30'}), 'unicode')  native2unicode(hex2dec({'96' '3b'}), 'unicode')  native2unicode(hex2dec({'62' '97'}), 'unicode') ', Nyquist (cd)']);
model.result('pg1').feature('nyq1').setIndex('descr', [native2unicode(hex2dec({'5b' 'f9'}), 'unicode')  native2unicode(hex2dec({'57' '30'}), 'unicode')  native2unicode(hex2dec({'96' '3b'}), 'unicode')  native2unicode(hex2dec({'62' '97'}), 'unicode') ], 0);
model.result('pg1').feature('nyq1').set('differential', 'off');
model.result('pg1').feature('nyq1').set('autodescr', 'off');
model.result('pg1').set('preserveaspect', 'on');
model.result('pg1').set('xlabelactive', true);
model.result('pg1').set('xlabel', 'real(Z) (\Omega m<sup>2</sup>)');
model.result('pg1').set('ylabelactive', true);
model.result('pg1').set('ylabel', '-imag(Z) (\Omega m<sup>2</sup>)');
model.result.create('pg2', 'PlotGroup1D');
model.result('pg2').set('data', 'dset1');
model.result('pg2').create('glob1', 'Global');
model.result('pg2').feature('glob1').set('unit', {''});
model.result('pg2').feature('glob1').set('expr', {'real(conj(cd.Zvsgrnd_pot1)) '});
model.result('pg2').feature('glob1').set('descr', {''});
model.result('pg2').label([native2unicode(hex2dec({'5b' 'f9'}), 'unicode')  native2unicode(hex2dec({'57' '30'}), 'unicode')  native2unicode(hex2dec({'96' '3b'}), 'unicode')  native2unicode(hex2dec({'62' '97'}), 'unicode') ', ' native2unicode(hex2dec({'5b' '9e'}), 'unicode')  native2unicode(hex2dec({'90' 'e8'}), 'unicode') ' (cd)']);
model.result('pg2').feature('glob1').setIndex('descr', [native2unicode(hex2dec({'5b' 'f9'}), 'unicode')  native2unicode(hex2dec({'57' '30'}), 'unicode')  native2unicode(hex2dec({'96' '3b'}), 'unicode')  native2unicode(hex2dec({'62' '97'}), 'unicode') ', ' native2unicode(hex2dec({'5b' '9e'}), 'unicode')  native2unicode(hex2dec({'90' 'e8'}), 'unicode') ], 0);
model.result('pg2').feature('glob1').set('differential', 'off');
model.result('pg2').feature('glob1').set('xdata', 'expr');
model.result('pg2').feature('glob1').set('xdataexpr', 'freq');
model.result('pg2').feature('glob1').set('autodescr', 'off');
model.result('pg2').feature('glob1').set('xdatasolnumtype', 'level1');
model.result('pg2').set('xlog', 'on');
model.result('pg2').set('ylabelactive', true);
model.result('pg2').set('ylabel', 'real(Z) (\Omega m<sup>2</sup>)');
model.result.create('pg3', 'PlotGroup1D');
model.result('pg3').set('data', 'dset1');
model.result('pg3').create('glob1', 'Global');
model.result('pg3').feature('glob1').set('unit', {''});
model.result('pg3').feature('glob1').set('expr', {'imag(conj(cd.Zvsgrnd_pot1)) '});
model.result('pg3').feature('glob1').set('descr', {''});
model.result('pg3').label([native2unicode(hex2dec({'5b' 'f9'}), 'unicode')  native2unicode(hex2dec({'57' '30'}), 'unicode')  native2unicode(hex2dec({'96' '3b'}), 'unicode')  native2unicode(hex2dec({'62' '97'}), 'unicode') ', ' native2unicode(hex2dec({'86' '5a'}), 'unicode')  native2unicode(hex2dec({'90' 'e8'}), 'unicode') ' (cd)']);
model.result('pg3').feature('glob1').setIndex('descr', [native2unicode(hex2dec({'5b' 'f9'}), 'unicode')  native2unicode(hex2dec({'57' '30'}), 'unicode')  native2unicode(hex2dec({'96' '3b'}), 'unicode')  native2unicode(hex2dec({'62' '97'}), 'unicode') ', ' native2unicode(hex2dec({'86' '5a'}), 'unicode')  native2unicode(hex2dec({'90' 'e8'}), 'unicode') ], 0);
model.result('pg3').feature('glob1').set('differential', 'off');
model.result('pg3').feature('glob1').set('xdata', 'expr');
model.result('pg3').feature('glob1').set('xdataexpr', 'freq');
model.result('pg3').feature('glob1').set('autodescr', 'off');
model.result('pg3').feature('glob1').set('xdatasolnumtype', 'level1');
model.result('pg3').set('xlog', 'on');
model.result('pg3').set('ylabelactive', true);
model.result('pg3').set('ylabel', '-imag(Z) (\Omega m<sup>2</sup>)');
model.result('pg1').run;
model.result('pg1').run;
model.result('pg1').run;

model.component('comp1').geom('geom1').run('fin');

model.component('comp1').physics('cd').feature('pot1').set('phisbnd', '3[V]');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'frlin');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'frlin');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').set('stol', 1.0E-4);
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(0.01,100,100000)'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'no');
model.sol('sol1').feature('s1').feature('p1').set('pdistrib', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'frlin');
model.sol('sol1').feature('s1').set('nonlin', 'linper');
model.sol('sol1').feature('s1').set('storelinpoint', true);
model.sol('sol1').feature('s1').set('linpsolnum', 'all');
model.sol('sol1').feature('s1').set('control', 'frlin');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg3').run;
model.result('pg3').feature('glob1').set('differential', true);
model.result('pg3').run;
model.result('pg3').feature('glob1').set('differential', false);

model.component('comp1').physics('cd').feature('pot1').set('phisbnd', '1.6[V]');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'frlin');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'frlin');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').set('stol', 1.0E-4);
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(0.01,100,100000)'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'no');
model.sol('sol1').feature('s1').feature('p1').set('pdistrib', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'frlin');
model.sol('sol1').feature('s1').set('nonlin', 'linper');
model.sol('sol1').feature('s1').set('storelinpoint', true);
model.sol('sol1').feature('s1').set('linpsolnum', 'all');
model.sol('sol1').feature('s1').set('control', 'frlin');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg2').run;
model.result('pg3').run;
model.result('pg2').run;
model.result('pg1').run;

model.component('comp1').physics('cd').feature('init1').set('phis', '1.6[V]');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'frlin');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'frlin');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').set('stol', 1.0E-4);
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(0.01,100,100000)'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'no');
model.sol('sol1').feature('s1').feature('p1').set('pdistrib', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'frlin');
model.sol('sol1').feature('s1').set('nonlin', 'linper');
model.sol('sol1').feature('s1').set('storelinpoint', true);
model.sol('sol1').feature('s1').set('linpsolnum', 'all');
model.sol('sol1').feature('s1').set('control', 'frlin');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;

model.label([native2unicode(hex2dec({'30' '10'}), 'unicode') 'EIS' native2unicode(hex2dec({'5f' 'ae'}), 'unicode')  native2unicode(hex2dec({'7c' '73'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'30' '11'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') '.mph']);

model.result('pg1').run;
model.result('pg1').run;
model.result('pg2').run;
model.result('pg3').run;
model.result('pg1').run;
model.result.export.create('plot1', 'pg1', 'nyq1', 'Plot');
model.result.export('plot1').label('Nyquist');
model.result.export('plot1').set('filename', ['C:\Users\lenovo\Desktop\' native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'63' '6e'}), 'unicode') '\EIS' native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'63' '6e'}), 'unicode') '\EIS' native2unicode(hex2dec({'53' '9f'}), 'unicode')  native2unicode(hex2dec({'59' 'cb'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'63' '6e'}), 'unicode')  native2unicode(hex2dec({'5b' 'fc'}), 'unicode')  native2unicode(hex2dec({'51' 'fa'}), 'unicode') '\' native2unicode(hex2dec({'5f' 'ae'}), 'unicode')  native2unicode(hex2dec({'7c' '73'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode') '-Nyquist.txt']);
model.result.export('plot1').run;
model.result('pg2').run;
model.result.export.create('plot2', 'pg2', 'glob1', 'Plot');
model.result.export('plot2').label([native2unicode(hex2dec({'5b' '9e'}), 'unicode')  native2unicode(hex2dec({'90' 'e8'}), 'unicode') ]);
model.result.export('plot2').set('filename', ['C:\Users\lenovo\Desktop\' native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'63' '6e'}), 'unicode') '\EIS' native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'63' '6e'}), 'unicode') '\EIS' native2unicode(hex2dec({'53' '9f'}), 'unicode')  native2unicode(hex2dec({'59' 'cb'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'63' '6e'}), 'unicode')  native2unicode(hex2dec({'5b' 'fc'}), 'unicode')  native2unicode(hex2dec({'51' 'fa'}), 'unicode') '\' native2unicode(hex2dec({'5f' 'ae'}), 'unicode')  native2unicode(hex2dec({'7c' '73'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode') '-' native2unicode(hex2dec({'5b' '9e'}), 'unicode')  native2unicode(hex2dec({'90' 'e8'}), 'unicode') '.txt']);
model.result.export('plot2').run;
model.result('pg3').run;
model.result.export.create('plot3', 'pg3', 'glob1', 'Plot');
model.result.export('plot3').label([native2unicode(hex2dec({'86' '5a'}), 'unicode')  native2unicode(hex2dec({'90' 'e8'}), 'unicode') ]);
model.result.export('plot3').set('filename', ['C:\Users\lenovo\Desktop\' native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'63' '6e'}), 'unicode') '\EIS' native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'63' '6e'}), 'unicode') '\EIS' native2unicode(hex2dec({'53' '9f'}), 'unicode')  native2unicode(hex2dec({'59' 'cb'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'63' '6e'}), 'unicode')  native2unicode(hex2dec({'5b' 'fc'}), 'unicode')  native2unicode(hex2dec({'51' 'fa'}), 'unicode') '\' native2unicode(hex2dec({'5f' 'ae'}), 'unicode')  native2unicode(hex2dec({'7c' '73'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode') '-' native2unicode(hex2dec({'86' '5a'}), 'unicode')  native2unicode(hex2dec({'90' 'e8'}), 'unicode') '.txt']);
model.result.export('plot3').run;

model.label([native2unicode(hex2dec({'30' '10'}), 'unicode') 'EIS' native2unicode(hex2dec({'5f' 'ae'}), 'unicode')  native2unicode(hex2dec({'7c' '73'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'30' '11'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') '.mph']);

model.result('pg2').run;

model.label([native2unicode(hex2dec({'30' '10'}), 'unicode') 'EIS' native2unicode(hex2dec({'5f' 'ae'}), 'unicode')  native2unicode(hex2dec({'7c' '73'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'30' '11'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'8d' '28'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'77' 'f3'}), 'unicode')  native2unicode(hex2dec({'58' 'a8'}), 'unicode')  native2unicode(hex2dec({'70' 'ef'}), 'unicode') '-' native2unicode(hex2dec({'8d' '85'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'5b' 'b9'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode')  native2unicode(hex2dec({'4f' '0f'}), 'unicode')  native2unicode(hex2dec({'5b' '89'}), 'unicode')  native2unicode(hex2dec({'6c' 'd5'}), 'unicode')  native2unicode(hex2dec({'60' '52'}), 'unicode')  native2unicode(hex2dec({'53' '8b'}), 'unicode')  native2unicode(hex2dec({'5f' 'aa'}), 'unicode')  native2unicode(hex2dec({'73' 'af'}), 'unicode') '--CV' native2unicode(hex2dec({'66' 'f2'}), 'unicode')  native2unicode(hex2dec({'7e' 'bf'}), 'unicode') '.mph']);

model.result.create('pg4', 'PlotGroup2D');
model.result('pg4').run;
model.result('pg4').run;
model.result.remove('pg4');
model.result.create('pg4', 'PlotGroup1D');
model.result('pg4').run;
model.result('pg4').create('ptgr1', 'PointGraph');
model.result('pg4').feature('ptgr1').set('markerpos', 'datapoints');
model.result('pg4').feature('ptgr1').set('linewidth', 'preference');
model.result('pg4').run;
model.result('pg4').run;

model.study('std1').feature('frlin').set('plist', 'range(0.01,1000,100000)');

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'frlin');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'frlin');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').set('stol', 1.0E-4);
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(0.01,1000,100000)'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'no');
model.sol('sol1').feature('s1').feature('p1').set('pdistrib', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'frlin');
model.sol('sol1').feature('s1').set('nonlin', 'linper');
model.sol('sol1').feature('s1').set('storelinpoint', true);
model.sol('sol1').feature('s1').set('linpsolnum', 'all');
model.sol('sol1').feature('s1').set('control', 'frlin');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature('ptgr1').set('data', 'dset1');
model.result('pg4').feature('ptgr1').selection.all;
model.result('pg4').run;
model.result('pg4').feature('ptgr1').selection.set([5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22]);
model.result('pg4').run;
model.result('pg4').feature('ptgr1').set('autodescr', true);
model.result('pg4').feature('ptgr1').set('autoexpr', true);
model.result('pg4').feature('ptgr1').set('legend', true);
model.result('pg4').feature('ptgr1').set('autoplotlabel', true);
model.result('pg4').feature('ptgr1').set('autounit', true);
model.result('pg4').feature('ptgr1').selection.set([6 8 10 12 14 16 18 20 22]);
model.result('pg4').run;
model.result('pg4').feature('ptgr1').set('autoplotlabel', false);
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').label([native2unicode(hex2dec({'54' '04'}), 'unicode')  native2unicode(hex2dec({'5c' '42'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'4f' '4d'}), 'unicode') ]);
model.result('pg4').set('xlog', true);
model.result.create('pg5', 'PlotGroup1D');
model.result('pg5').run;
model.result('pg5').create('ptgr1', 'PointGraph');
model.result('pg5').feature('ptgr1').set('markerpos', 'datapoints');
model.result('pg5').feature('ptgr1').set('linewidth', 'preference');
model.result('pg5').feature('ptgr1').set('expr', 'cd.nIs');
model.result('pg5').feature('ptgr1').set('descr', [native2unicode(hex2dec({'6c' 'd5'}), 'unicode')  native2unicode(hex2dec({'54' '11'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ]);
model.result.create('pg6', 'PlotGroup2D');
model.result('pg6').run;
model.result('pg6').create('surf1', 'Surface');
model.result('pg6').feature('surf1').set('expr', 'cd.IsMag');
model.result('pg6').feature('surf1').set('descr', [native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode')  native2unicode(hex2dec({'59' '27'}), 'unicode')  native2unicode(hex2dec({'5c' '0f'}), 'unicode') ]);
model.result('pg6').run;
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 5]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 5 7]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 5 7 9]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 7 9]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7 9]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7 8 9]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7 8 9 10]);
model.result('pg6').setIndex('looplevel', 99, 0);
model.result('pg6').setIndex('looplevel', 98, 0);
model.result('pg6').setIndex('looplevel', 97, 0);
model.result('pg6').setIndex('looplevel', 96, 0);
model.result('pg6').setIndex('looplevel', 95, 0);
model.result('pg6').setIndex('looplevel', 94, 0);
model.result('pg6').setIndex('looplevel', 93, 0);
model.result('pg6').setIndex('looplevel', 94, 0);
model.result('pg6').setIndex('looplevel', 95, 0);
model.result('pg6').setIndex('looplevel', 96, 0);
model.result('pg6').setIndex('looplevel', 95, 0);
model.result('pg6').setIndex('looplevel', 94, 0);
model.result('pg6').setIndex('looplevel', 93, 0);
model.result('pg6').setIndex('looplevel', 92, 0);
model.result('pg6').setIndex('looplevel', 91, 0);
model.result('pg6').setIndex('looplevel', 90, 0);
model.result('pg6').setIndex('looplevel', 89, 0);
model.result('pg6').setIndex('looplevel', 88, 0);
model.result('pg6').setIndex('looplevel', 87, 0);
model.result('pg6').setIndex('looplevel', 86, 0);
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').setIndex('looplevel', 2, 0);
model.result('pg6').run;
model.result('pg6').set('showlegendsmaxmin', true);
model.result.export.create('anim1', 'Animation');
model.result.export('anim1').set('target', 'player');
model.result.export('anim1').set('plotgroup', 'pg6');
model.result.export('anim1').run;
model.result.export('anim1').set('framesel', 'all');
model.result.export('anim1').showFrame;
model.result.export('anim1').set('maxframes', 100);
model.result.export('anim1').set('showframe', 88);
model.result.export('anim1').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').feature('surf1').create('def1', 'Deform');
model.result('pg6').run;
model.result('pg6').feature('surf1').feature('def1').set('scaleactive', true);
model.result('pg6').feature('surf1').feature.remove('def1');
model.result('pg6').run;
model.result('pg5').run;
model.result('pg6').run;
model.result.export.create('plot4', 'Plot');
model.result.export.remove('plot4');
model.result.export('anim1').showFrame;
model.result('pg5').run;
model.result.remove('pg5');
model.result('pg6').run;
model.result.export('anim1').showFrame;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg4').run;
model.result('pg6').run;
model.result('pg6').run;
model.result.export.create('plot4', 'pg6', 'surf1', 'Plot');
model.result.export('plot4').set('filename', ['C:\Users\lenovo\Desktop\' native2unicode(hex2dec({'5c' '42'}), 'unicode')  native2unicode(hex2dec({'53' 'e0'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') '.txt']);
model.result.export('plot4').run;
model.result.export('anim1').showFrame;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').selection.geom('geom1', 0);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7 8]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7 8 9]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7 8 9 10]);
model.result('pg6').run;
model.result('pg6').setIndex('looplevel', 3, 0);
model.result('pg6').run;
model.result('pg6').setIndex('looplevel', 14, 0);
model.result('pg6').run;
model.result('pg6').setIndex('looplevel', 29, 0);
model.result('pg6').run;
model.result('pg6').run;
model.result('pg4').run;
model.result('pg6').run;
model.result('pg6').setIndex('looplevel', 1, 0);
model.result('pg6').run;
model.result('pg6').setIndex('looplevel', 14, 0);
model.result('pg6').run;
model.result.export('anim1').showFrame;
model.result.export('anim1').run;
model.result('pg6').run;
model.result('pg6').setIndex('looplevel', 15, 0);
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').feature('surf1').set('expr', 'cd.IsMag');
model.result('pg6').feature('surf1').set('descr', [native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode')  native2unicode(hex2dec({'59' '27'}), 'unicode')  native2unicode(hex2dec({'5c' '0f'}), 'unicode') ]);
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').selection.geom('geom1');
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').run;
model.result('pg6').feature('surf1').set('expr', 'cd.IsMag');
model.result('pg6').feature('surf1').set('descr', [native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode')  native2unicode(hex2dec({'59' '27'}), 'unicode')  native2unicode(hex2dec({'5c' '0f'}), 'unicode') ]);
model.result('pg6').run;
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7 8]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7 8 9]);
model.result('pg6').selection.geom('geom1', 2);
model.result('pg6').selection.set([3 4 5 6 7 8 9 10]);

model.sol('sol1').study('std1');
model.sol('sol1').feature.remove('s1');
model.sol('sol1').feature.remove('v1');
model.sol('sol1').feature.remove('st1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').feature('st1').set('study', 'std1');
model.sol('sol1').feature('st1').set('studystep', 'frlin');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').feature('v1').set('control', 'frlin');
model.sol('sol1').create('s1', 'Stationary');
model.sol('sol1').feature('s1').set('stol', 1.0E-4);
model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').feature.remove('pDef');
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'range(0.01,1000,100000)'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'Hz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'no');
model.sol('sol1').feature('s1').feature('p1').set('pdistrib', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plot', 'off');
model.sol('sol1').feature('s1').feature('p1').set('plotgroup', 'pg1');
model.sol('sol1').feature('s1').feature('p1').set('probesel', 'all');
model.sol('sol1').feature('s1').feature('p1').set('probes', {});
model.sol('sol1').feature('s1').feature('p1').set('control', 'frlin');
model.sol('sol1').feature('s1').set('nonlin', 'linper');
model.sol('sol1').feature('s1').set('storelinpoint', true);
model.sol('sol1').feature('s1').set('linpsolnum', 'all');
model.sol('sol1').feature('s1').set('control', 'frlin');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('d1').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').create('i1', 'Iterative');
model.sol('sol1').feature('s1').feature('i1').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i1').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i1').label([native2unicode(hex2dec({'4e' 'e3'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i1').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('prefun', 'saamg');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('maxcoarsedof', 50000);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('saamgcompwise', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').set('compactaggregation', true);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i1').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').create('i2', 'Iterative');
model.sol('sol1').feature('s1').feature('i2').set('maxlinit', 1000);
model.sol('sol1').feature('s1').feature('i2').set('nlinnormuse', 'on');
model.sol('sol1').feature('s1').feature('i2').label([native2unicode(hex2dec({'51' 'e0'}), 'unicode')  native2unicode(hex2dec({'4f' '55'}), 'unicode')  native2unicode(hex2dec({'59' '1a'}), 'unicode')  native2unicode(hex2dec({'91' 'cd'}), 'unicode')  native2unicode(hex2dec({'7f' '51'}), 'unicode')  native2unicode(hex2dec({'68' '3c'}), 'unicode') ' (cd)']);
model.sol('sol1').feature('s1').feature('i2').create('mg1', 'Multigrid');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('pr').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').create('sc1', 'SCGS');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('linesweeptype', 'ssor');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('iter', 1);
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('po').feature('sc1').set('scgsmethod', 'lines');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature('i2').feature('mg1').feature('cs').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').feature('s1').feature('fc1').set('linsolver', 'd1');
model.sol('sol1').feature('s1').feature('fc1').set('dtech', 'auto');
model.sol('sol1').feature('s1').feature.remove('fcDef');
model.sol('sol1').attach('std1');
model.sol('sol1').runAll;

model.result('pg1').run;
model.result('pg6').run;
model.result('pg6').feature('surf1').set('data', 'dset1');
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 89, 0);
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 7, 0);
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 14, 0);
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 27, 0);
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 40, 0);
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 55, 0);
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 66, 0);
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 81, 0);
model.result('pg6').feature('surf1').setIndex('looplevel', 98, 0);
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 100, 0);
model.result('pg6').run;
model.result('pg6').feature('surf1').setIndex('looplevel', 1, 0);
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').create('mms1', 'MaxMinSurface');
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').feature('mms1').set('data', 'parent');
model.result('pg6').feature('mms1').set('expr', 'cd.IsMag');
model.result('pg6').feature('mms1').set('descr', [native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode')  native2unicode(hex2dec({'59' '27'}), 'unicode')  native2unicode(hex2dec({'5c' '0f'}), 'unicode') ]);
model.result('pg6').feature('mms1').set('display', 'max');
model.result('pg6').run;
model.result('pg6').feature('mms1').set('color', 'white');
model.result('pg6').feature('mms1').set('display', 'min');
model.result('pg6').run;
model.result('pg6').feature('mms1').set('color', 'black');
model.result('pg6').run;
model.result('pg6').set('lastinputmode', 'evaluate');
model.result('pg6').set('inputmode', 'linefirst');
model.result('pg6').set('lastinputmode', 'linefirst');
model.result('pg6').set('inputmode', 'evaluate');
model.result('pg6').run;
model.result('pg6').set('lastinputmode', 'evaluate');
model.result('pg6').set('inputmode', 'linefirst');
model.result('pg6').set('lastinputmode', 'linefirst');
model.result('pg6').set('inputmode', 'evaluate');
model.result('pg6').run;
model.result('pg6').set('lastinputmode', 'evaluate');
model.result('pg6').set('inputmode', 'linefirst');
model.result('pg6').run;
model.result('pg6').set('linefirst', [2.364762544631958 7.902634143829346 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.36476 7.90263; 4.01499 10]);
model.result('pg6').set('cutlinedshash', -1161117453);
model.result('pg7').set('data', 'cln1');
model.result('pg6').set('cutlinepgds', 'cln1');
model.result('pg6').run;
model.result('pg6').set('lastinputmode', 'linefirst');
model.result('pg6').set('inputmode', 'linesecond');
model.result('pg6').set('lastinputmode', 'linesecond');
model.result('pg6').set('inputmode', 'evaluate');
model.result('pg6').run;
model.result('pg6').set('lastinputmode', 'evaluate');
model.result('pg6').set('inputmode', 'linesecond');
model.result('pg6').set('linesecond', [2.6056361198425293 8.21960735321045 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.36476 7.90263; 2.60564 8.2196]);
model.result('pg6').set('cutlinedshash', -530416798);
model.result('pg7').set('data', 'cln1');
model.result('pg6').set('cutlinepgds', 'cln1');
model.result('pg6').set('linesecond', [2.4276676177978516 7.920619964599609 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.36476 7.90263; 2.42767 7.92062]);
model.result('pg6').set('cutlinedshash', -14399021);
model.result('pg7').set('data', 'cln1');
model.result('pg6').set('cutlinepgds', 'cln1');
model.result('pg6').set('linesecond', [2.392073631286621 7.920619964599609 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.36476 7.90263; 2.39208 7.92062]);
model.result('pg6').set('cutlinedshash', 2052293741);
model.result('pg7').set('data', 'cln1');
model.result('pg6').set('cutlinepgds', 'cln1');
model.result('pg6').set('linesecond', [2.449023723602295 7.813838958740234 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.36476 7.90263; 2.44903 7.81383]);
model.result('pg6').set('cutlinedshash', 677138679);
model.result('pg7').set('data', 'cln1');
model.result('pg6').set('cutlinepgds', 'cln1');
model.result('pg6').set('linesecond', [2.3991923332214355 7.756889343261719 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.36476 7.90263; 2.3992 7.75689]);
model.result('pg6').set('cutlinedshash', -1761613870);
model.result('pg7').set('data', 'cln1');
model.result('pg6').set('cutlinepgds', 'cln1');
model.result('pg6').set('linesecond', [2.40631103515625 7.749770164489746 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.36476 7.90263; 2.40632 7.74976]);
model.result('pg6').set('cutlinedshash', -376519910);
model.result('pg7').set('data', 'cln1');
model.result('pg6').set('cutlinepgds', 'cln1');
model.result('pg6').set('linesecond', [5.018889427185059 7.95621395111084 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.36476 7.90263; 5.01888 7.95619]);
model.result('pg6').set('cutlinedshash', 1893645762);
model.result('pg7').set('data', 'cln1');
model.result('pg6').set('cutlinepgds', 'cln1');
model.result('pg6').set('linesecond', [5.8359880447387695 7.897374153137207 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.36476 7.90263; 5.836 7.89735]);
model.result('pg6').set('cutlinedshash', -1294255108);
model.result('pg7').set('data', 'cln1');
model.result('pg6').set('cutlinepgds', 'cln1');
model.result('pg6').set('lastinputmode', 'linesecond');
model.result('pg6').set('inputmode', 'evaluate');

model.component('comp1').geom('geom1').run('r13');
model.component('comp1').geom('geom1').create('sca1', 'Scale');
model.component('comp1').geom('geom1').feature('sca1').selection('input').set({'r3' 'r5' 'r7' 'r9'});
model.component('comp1').geom('geom1').feature('sca1').set('isotropic', 0.05);
model.component('comp1').geom('geom1').run('sca1');
model.component('comp1').geom('geom1').feature('sca1').set('isotropic', 0.5);
model.component('comp1').geom('geom1').run('sca1');
model.component('comp1').geom('geom1').feature.remove('sca1');
model.component('comp1').geom('geom1').run('fin');
model.component('comp1').geom('geom1').run('fin');

model.result('pg6').run;

model.component('comp1').probe.create('pdom1', 'DomainPoint');
model.component('comp1').probe('pdom1').set('coords', [3.0051701 9.9535121]);
model.component('comp1').probe('pdom1').setIndex('coords2', 9.9, 1);
model.component('comp1').probe('pdom1').setIndex('coords2', 3.005, 0);
model.component('comp1').probe.create('pdom2', 'DomainPoint');
model.component('comp1').probe('pdom2').setIndex('coords2', 9.9, 1);
model.component('comp1').probe('pdom2').setIndex('coords2', 3.3, 0);
model.component('comp1').probe.create('pdom3', 'DomainPoint');
model.component('comp1').probe('pdom3').set('coords', [3.5150913 9.9166306]);
model.component('comp1').probe('pdom3').setIndex('coords2', 9.9, 1);
model.component('comp1').probe('pdom3').setIndex('coords2', 3.515, 0);
model.component('comp1').probe.create('pdom4', 'DomainPoint');
model.component('comp1').probe('pdom4').set('coords', [3.7673921 9.9781026]);
model.component('comp1').probe('pdom4').setIndex('coords2', 3.8, 0);
model.component('comp1').probe('pdom4').setIndex('coords2', 9.9, 1);
model.component('comp1').probe('pdom4').set('coords', [3.4076676 10.1790781]);
model.component('comp1').probe('pdom4').setIndex('coords2', 3.8, 0);
model.component('comp1').probe('pdom4').setIndex('coords2', 9.9, 1);
model.component('comp1').probe.create('pdom5', 'DomainPoint');
model.component('comp1').probe('pdom5').set('coords', [4.0250254 9.982914]);
model.component('comp1').probe('pdom5').setIndex('coords2', 4.025, 0);
model.component('comp1').probe('pdom5').setIndex('coords2', 9.9, 1);
model.component('comp1').probe.create('pdom6', 'DomainPoint');
model.component('comp1').probe('pdom6').set('coords', [4.2628875 9.9417619]);
model.component('comp1').probe('pdom6').setIndex('coords2', 4.26, 0);
model.component('comp1').probe('pdom6').setIndex('coords2', 9.9, 1);
model.component('comp1').probe.create('pdom7', 'DomainPoint');
model.component('comp1').probe('pdom7').set('coords', [4.5253309 9.9855919]);
model.component('comp1').probe('pdom7').setIndex('coords2', 4.525, 0);
model.component('comp1').probe('pdom7').setIndex('coords2', 9.9, 1);
model.component('comp1').probe.create('pdom8', 'DomainPoint');
model.component('comp1').probe('pdom8').set('coords', [4.7770829 9.9455042]);
model.component('comp1').probe('pdom8').setIndex('coords2', 4.755, 0);
model.component('comp1').probe('pdom8').setIndex('coords2', 9.9, 1);

model.result.create('pg8', 'PlotGroup1D');
model.result('pg8').run;
model.result('pg8').create('lngr1', 'LineGraph');
model.result('pg8').feature('lngr1').set('markerpos', 'datapoints');
model.result('pg8').feature('lngr1').set('linewidth', 'preference');
model.result('pg8').feature('lngr1').set('data', 'dset1');
model.result('pg8').run;
model.result('pg8').run;
model.result.remove('pg8');
model.result('pg1').set('windowtitle', [native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ]);
model.result('pg2').set('windowtitle', [native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ]);
model.result('pg4').set('windowtitle', [native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ]);
model.result('pg3').set('windowtitle', [native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'5f' '62'}), 'unicode') ]);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg6').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('xdata', 'spacevar');
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('cutline', 'cln1');
model.result('pg7').feature('lngr1').set('linefirst', [2.515000104904175 0 0]);
model.result('pg7').feature('lngr1').set('linesecond', [2.515000104904175 10 0]);
model.result('pg7').feature('lngr1').set('lineisinit', true);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.515 0; 2.515 10]);
model.result('pg7').feature('lngr1').set('cutmode', true);
model.result('pg7').feature('lngr1').set('inputmode', 'linefirst');
model.result('pg7').feature('lngr1').set('linefirst', [2.5017175674438477 8.286520004272461 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.50172 8.28651; 2.515 10]);
model.result('pg7').feature('lngr1').set('inputmode', 'linesecond');
model.result('pg7').feature('lngr1').set('linesecond', [5.032431602478027 8.41999626159668 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.50172 8.28651; 5.03242 8.42]);
model.result('pg7').feature('lngr1').set('linesecond', [5.027092456817627 8.339910507202148 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.50172 8.28651; 5.02709 8.3399]);
model.result('pg7').feature('lngr1').set('linesecond', [5.027092456817627 8.238469123840332 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.50172 8.28651; 5.02709 8.23846]);
model.result('pg7').feature('lngr1').set('linesecond', [2.539091110229492 9.477130889892578 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.50172 8.28651; 2.53907 9.47713]);
model.result('pg7').feature('lngr1').set('linesecond', [5.027092456817627 9.658658981323242 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.50172 8.28651; 5.02709 9.65867]);
model.result('pg7').feature('lngr1').set('inputmode', 'linefirst');
model.result('pg7').feature('lngr1').set('linefirst', [2.432309627532959 9.514504432678223 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.43231 9.5145; 5.02709 9.65867]);
model.result('pg7').feature('lngr1').set('linefirst', [2.44832706451416 9.71204948425293 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.44831 9.71204; 5.02709 9.65867]);
model.result('pg7').feature('lngr1').set('linefirst', [2.4857001304626465 9.599928855895996 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.4857 9.59993; 5.02709 9.65867]);
model.result('pg7').feature('lngr1').set('linefirst', [2.9982500076293945 9.605268478393555 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.99825 9.60527; 5.02709 9.65867]);
model.result('pg7').feature('lngr1').set('linefirst', [3.0028645992279053 9.831656455993652 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [3.00286 9.83167; 5.02709 9.65867]);
model.result('pg7').feature('lngr1').set('inputmode', 'linesecond');
model.result('pg7').feature('lngr1').set('linesecond', [5.031304836273193 9.827858924865723 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [3.00286 9.83167; 5.03129 9.82787]);
model.result('pg7').feature('lngr1').set('linesecond', [4.812116622924805 9.832926750183105 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [3.00286 9.83167; 4.81212 9.83294]);
model.result('pg7').feature('lngr1').set('inputmode', 'linefirst');
model.result('pg7').feature('lngr1').set('linefirst', [3.0055737495422363 9.831626892089844 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [3.00557 9.83163; 4.81212 9.83294]);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').feature('lngr1').set('cutmode', 'off');
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('xdata', 'expr');
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg6').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('xdata', 'arc');
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('linewidthslider', 10);
model.result('pg7').feature('lngr1').set('autoplotlabel', true);
model.result('pg7').feature('lngr1').set('autodescr', true);
model.result('pg7').feature('lngr1').set('autoexpr', true);
model.result('pg7').feature('lngr1').set('autounit', true);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('linewidth', 10);
model.result('pg7').feature('lngr1').set('linewidthslider', 1);
model.result('pg7').feature('lngr1').set('linecolor', 'cycle');
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result.export.create('plot5', 'pg7', 'lngr1', 'Plot');
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg6').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg6').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ]);
model.result('pg7').set('xlog', true);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('xlog', false);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('manualgrid', true);
model.result('pg7').set('xspacing', 0.5);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('xspacing', 1);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('showgrid', false);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('showgrid', true);
model.result('pg7').set('manualgrid', false);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result.export('plot5').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') ]);
model.result.export('plot5').set('filename', ['C:\Users\lenovo\Desktop\' native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'6d' '41'}), 'unicode')  native2unicode(hex2dec({'5b' 'c6'}), 'unicode')  native2unicode(hex2dec({'5e' 'a6'}), 'unicode') '.txt']);
model.result.export('plot5').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('cutline', 'cln1');
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [3.00557 9.83163; 4.81212 9.83294]);
model.result('pg7').feature('lngr1').set('cutmode', true);
model.result('pg7').feature('lngr1').set('linefirst', [3.0007433891296387 9.83261775970459 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [3.00075 9.83262; 4.81212 9.83294]);
model.result('pg7').feature('lngr1').set('linefirst', [2.9989287853240967 9.962366104125977 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.99893 9.96237; 4.81212 9.83294]);
model.result('pg7').feature('lngr1').set('inputmode', 'linesecond');
model.result('pg7').feature('lngr1').set('linesecond', [5.024212837219238 9.937898635864258 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.99893 9.96237; 5.02421 9.9379]);
model.result('pg7').feature('lngr1').set('linesecond', [5.030970573425293 9.968306541442871 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.99893 9.96237; 5.03096 9.96831]);
model.result('pg7').feature('lngr1').set('linesecond', [5.030970573425293 9.961548805236816 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.99893 9.96237; 5.03096 9.96155]);
model.result('pg7').feature('lngr1').set('linesecond', [5.150911331176758 9.993645668029785 -1]);
model.result.dataset('cln1').set('method', 'twopoint');
model.result.dataset('cln1').set('genpoints', [2.99893 9.96237; 5.1509 9.99365]);
model.result('pg7').feature('lngr1').set('cutmode', false);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result.export('plot5').run;
model.result('pg4').run;
model.result('pg4').set('showlegends', false);
model.result('pg4').set('xlog', false);
model.result('pg6').feature('mms1').active(false);
model.result('pg6').feature('mms1').active(true);
model.result('pg6').feature('mms1').active(false);
model.result('pg6').feature('mms1').active(true);
model.result('pg4').run;
model.result('pg4').run;
model.result.export.create('plot6', 'pg4', 'ptgr1', 'Plot');
model.result.export('plot6').label([native2unicode(hex2dec({'54' '04'}), 'unicode')  native2unicode(hex2dec({'5c' '42'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'4f' '4d'}), 'unicode') ]);
model.result.export('plot6').set('filename', ['C:\Users\lenovo\Desktop\' native2unicode(hex2dec({'54' '04'}), 'unicode')  native2unicode(hex2dec({'5c' '42'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'67' '81'}), 'unicode')  native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'4f' '4d'}), 'unicode') '.txt']);
model.result.export('plot6').run;
model.result('pg4').run;
model.result('pg6').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('linewidthslider', 4);
model.result('pg7').feature('lngr1').set('legend', true);
model.result('pg7').feature('lngr1').set('autoexpr', false);
model.result('pg7').feature('lngr1').set('autounit', false);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('autodescr', false);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('autosolution', false);
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').feature('lngr1').set('autoplotlabel', false);
model.result('pg7').feature('lngr1').set('linecolor', 'custom');
model.result('pg7').feature('lngr1').set('customlinecolor', [0.03921568766236305 0.003921568859368563 0.01568627543747425]);
model.result('pg7').feature('lngr1').set('linecolor', 'cycle');
model.result('pg7').feature('lngr1').set('legend', false);
model.result('pg7').feature('lngr1').set('resolution', 'finer');
model.result('pg7').feature('lngr1').set('legendexprprecision', 10);
model.result('pg7').feature('lngr1').set('titletype', 'none');
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg7').set('xlabelactive', true);
model.result('pg7').set('xlabel', ['Stacked electrode (' native2unicode(hex2dec({'00' 'b5'}), 'unicode') 'm)']);
model.result('pg7').set('ylabelactive', true);
model.result('pg7').set('ylabel', 'Electrode current density (A/m<sup>2</sup>)');
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').set('xlabelactive', true);
model.result('pg4').set('ylabelactive', true);
model.result('pg4').set('ylabel', 'Electrolyte potential (V)');
model.result('pg4').run;
model.result('pg4').feature('ptgr1').set('linewidth', 5);
model.result('pg4').feature('ptgr1').set('linewidthslider', 4);
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature('ptgr1').setIndex('looplevelinput', 'first', 0);
model.result('pg4').run;
model.result('pg4').feature('ptgr1').setIndex('looplevelinput', 'all', 0);
model.result('pg4').run;
model.result('pg4').set('showlegends', true);
model.result('pg4').set('ylog', false);
model.result('pg4').feature('ptgr1').set('legendmethod', 'manual');
model.result('pg4').feature('ptgr1').setIndex('legends', 1, 0);
model.result('pg4').feature('ptgr1').setIndex('legends', 2, 1);
model.result('pg4').feature('ptgr1').setIndex('legends', 3, 2);
model.result('pg4').feature('ptgr1').setIndex('legends', 4, 3);
model.result('pg4').feature('ptgr1').setIndex('legends', 5, 4);
model.result('pg4').feature('ptgr1').setIndex('legends', 6, 5);
model.result('pg4').feature('ptgr1').setIndex('legends', 7, 6);
model.result('pg4').feature('ptgr1').setIndex('legends', 8, 7);
model.result('pg4').feature('ptgr1').setIndex('legends', 9, 8);
model.result('pg4').feature('ptgr1').set('linecolor', 'cyclereset');
model.result('pg4').run;
model.result('pg4').feature('ptgr1').set('colorcycle', 'long');
model.result('pg4').feature('ptgr1').set('linecolor', 'cycle');
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').set('legendpos', 'manual');
model.result('pg4').set('axisactive', true);
model.result('pg4').set('axistrailingzeros', true);
model.result('pg4').set('axisactive', false);
model.result('pg4').run;
model.result('pg4').set('legendposy', 0.5);
model.result('pg4').run;
model.result('pg4').set('legendposx', 0.8);
model.result('pg4').run;
model.result('pg4').set('legendposy', 0.8);
model.result('pg4').run;
model.result('pg4').set('legendposy', 0.7);
model.result('pg4').run;
model.result('pg4').set('xlog', false);
model.result('pg4').set('preserveaspect', false);
model.result('pg4').set('legendposx', 0.9);
model.result('pg4').run;
model.result('pg4').run;
model.result('pg4').feature('ptgr1').set('linewidthslider', 5);
model.result('pg4').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;
model.result('pg4').run;
model.result('pg4').feature('ptgr1').set('linemarker', 'cycle');
model.result('pg4').feature('ptgr1').set('markerpos', 'interp');
model.result('pg4').feature('ptgr1').set('markers', 2);
model.result('pg4').feature('ptgr1').set('linemarker', 'cyclereset');
model.result('pg4').run;
model.result('pg4').feature('ptgr1').set('linemarker', 'cyclereset');
model.result('pg4').run;
model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;

model.label('The simulation of interface characteristics and charge transfer dynamics for layered electrodes using cascade capacitance in supercapacitors by COMSOL software.mph');

model.result('pg7').set('window', 'window2');
model.result('pg7').set('windowtitle', [native2unicode(hex2dec({'7e' 'd8'}), 'unicode')  native2unicode(hex2dec({'56' 'fe'}), 'unicode')  native2unicode(hex2dec({'20' '1c'}), 'unicode') '2' native2unicode(hex2dec({'20' '1d'}), 'unicode') ]);
model.result('pg7').run;

out = model;

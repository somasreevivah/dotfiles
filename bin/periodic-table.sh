
__SCRIPT_VERSION="0.0.1"
__SCRIPT_NAME=$( basename $0 )
__DESCRIPTION="ASCII periodic table for fast consulting"


function usage_head() { echo "Usage :  $__SCRIPT_NAME [-h|-help] [-v|-version] [-e <element_symbold_lowercase>]"; }
function usage ()
{
cat <<EOF
$(usage_head)

    $__DESCRIPTION

    Options:
    -h|help       Display this message
    -v|version    Display script version"
    -e            Display element information (lowercase elements):
                  Example: $__SCRIPT_NAME -e he > helium_info.txt


    This program is maintained by Alejandro Gallo.

    References:
      [1] http://ascii.periodni.com/
EOF
}    # ----------  end of function usage  ----------

while getopts ":hve:" opt
do
  case $opt in

  h|help     )  usage; exit 0   ;;

  v|version  )  echo "$__SCRIPT_NAME -- Version $__SCRIPT_VERSION"; exit 0   ;;

  e  )  ELEMENT=$OPTARG   ;;

  * )  echo -e "\n  Option does not exist : $OPTARG\n"
      usage_head; exit 1   ;;

  esac    # --- end of case ---
done
shift $(($OPTIND-1))

if [[ -z $ELEMENT ]]; then cat <<EOF
  __________________________________________________________________________
 |   1   2   3   4   5   6   7   8   9   10  11  12  13  14  15  16  17  18 |
 |                                                                          |
 |1  H                                                                   He |
 |                                                                          |
 |2  Li  Be                                          B   C   N   O   F   Ne |
 |                                                                          |
 |3  Na  Mg                                          Al  Si  P   S   Cl  Ar |
 |                                                                          |
 |4  K   Ca  Sc  Ti  V   Cr  Mn  Fe  Co  Ni  Cu  Zn  Ga  Ge  As  Se  Br  Kr |
 |                                                                          |
 |5  Rb  Sr  Y   Zr  Nb  Mo  Tc  Ru  Rh  Pd  Ag  Cd  In  Sn  Sb  Te  I   Xe |
 |                                                                          |
 |6  Cs  Ba  *   Hf  Ta  W   Re  Os  Ir  Pt  Au  Hg  Tl  Pb  Bi  Po  At  Rn |
 |                                                                          |
 |7  Fr  Ra  **  Rf  Db  Sg  Bh  Hs  Mt  Ds  Rg  Cn  Uut Fl  Uup Lv  Uus Uuo|
 |__________________________________________________________________________|
 |                                                                          |
 |                                                                          |
 | Lantanoidi*   La  Ce  Pr  Nd  Pm  Sm  Eu  Gd  Tb  Dy  Ho  Er  Tm  Yb  Lu |
 |                                                                          |
 |  Aktinoidi**  Ac  Th  Pa  U   Np  Pu  Am  Cm  Bk  Cf  Es  Fm  Md  No  Lr |
 |__________________________________________________________________________|
EOF
fi

if [[ $ELEMENT = "ac" ]]; then
cat <<EOF

      Ac

    Relative atomic mass: [227]

    English: Actinium
    French: Actinium
    Croatian: Aktinij
    German: Actinium
    Italian: Attinio
    Spanish: Actinio

    Atomic number: 89
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1899 Andre-Louis Debierne (FR)

Actinium was discovered by Andre-Louis Debierne (FR) in 1899. The origin
of the name comes from the Greek word 'aktinos' meaning 'ray'. It is a
heavy, silvery-white, very radioactive metal that reacts with water and
glows in the dark. Actinium is extremely rare, found in all uranium
ores. It's usually obtained by treating radium with neutrons in a
reactor.

    Electronic configuration: [Rn] 6d1 7s2
    Formal oxidation number: +3
    Atomic radius: 188 pm

    Electronegativities: 1.1
    Thermal conductivity: 12 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 1051 oC
    Boiling point: 3198 oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 406 kJ/mol
EOF
fi
if [[ $ELEMENT = "ag" ]]; then
cat <<EOF

      Ag

    Relative atomic mass: 107.8682 +- 0.0002

    English: Silver
    French: Argent
    Croatian: Srebro
    German: Silber
    Italian: Argento
    Spanish: Plata

    Atomic number: 47
    Group numbers: 11
    Period: 5
    Standard state (20 oC): solid

    Discovery: - -

Silver has been known since ancient times. The origin of the name comes
from the Latin word 'argentum' meaning 'silver'. It is a silvery-ductile
and malleable metal, stable in water and oxygen. Silver reacts with
sulfur compounds to form black sulfides. Silver is found in ores called
argentite (AgS), light ruby silver (Ag3AsS3), dark ruby silver (Ag3SbS3)
and brittle silver. It is used in alloys for jewellery and in other
compounds for photography. Silver is also a good conductor, but
expensive.

    Electronic configuration: [Kr] 4d10 5s1
    Formal oxidation number: +1
    Atomic radius: 144.5 pm

    Electronegativities: 1.93
    Thermal conductivity: 429 W/(m K)
    Electrical resistivity (20 oC): 1.59 microOhm cm

    Melting point: 961.78 oC
    Boiling point: 2162 oC

    Heat of fusion: 11.3 kJ/mol
    Heat of vaporization: 257.7 kJ/mol
    Heat of atomization: 284.09 kJ/mol
EOF
fi
if [[ $ELEMENT = "al" ]]; then
cat <<EOF

      Al

    Relative atomic mass: 26.9815386 +- 0.0000008

    English: Aluminium (Aluminum)
    French: Aluminium
    Croatian: Aluminij
    German: Aluminium
    Italian: Alluminio
    Spanish: Aluminio

    Atomic number: 13
    Group numbers: 13
    Period: 3
    Standard state (20 oC): solid

    Discovery: 1825 Hans Christian Orsted (DK)

Aluminium (or aluminum) was discovered by Hans Christian Orsted (DK) in
1825. The origin of the name comes from the Latin word 'alumen' meaning
'alum'. It is a soft, lightweight, silvery-white metal. Exposed surfaces
quickly form protective oxide coating. It reacts violently with
oxidants. Aluminium is third most abundant element in the earth's crust.
Aluminium is the most abundant metal to be found in the earth's crust,
but is never found free in nature. Aluminium is obtained by electrolysis
from bauxite. Aluminium used for many purposes from airplanes to
beverage cans. It is too soft in its pure form so less than 1 % of
silicon or iron is added, which hardens and strengthens it.

    Electronic configuration: [Ne] 3s2 3p1
    Formal oxidation number: +3
    Atomic radius: 143.2 pm

    Electronegativities: 1.61
    Thermal conductivity: 237 W/(m K)
    Electrical resistivity (20 oC): 2.65 microOhm cm

    Melting point: 660.32 oC
    Boiling point: 2519 oC

    Heat of fusion: 10.67 kJ/mol
    Heat of vaporization: 290.8 kJ/mol
    Heat of atomization: 324.01 kJ/mol
EOF
fi
if [[ $ELEMENT = "am" ]]; then
cat <<EOF

      Am

    Relative atomic mass: [243]

    English: Americium
    French: Americium
    Croatian: Americij
    German: Americium
    Italian: Americio
    Spanish: Americio

    Atomic number: 95
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1944 Glenn T. Seaborg, Ralph A. James, Leon O. Morgan, Albert Ghiorso (US)

Americium was discovered by Glenn T. Seaborg, Ralph A. James, Leon O.
Morgan, and Albert Ghiorso (US) in 1944. Named for the 'American'
continent. It is a silvery-white, artificially produced radioactive
metal. Americium was produced by bombarding plutonium with neutrons.
Americium-241 is currently used in smoke detectors.

    Electronic configuration: [Rn] 5f7 7s2
    Formal oxidation number: +3 +4 +5 +6
    Atomic radius: 173 pm

    Electronegativities: -
    Thermal conductivity: 10 W/(m K)
    Electrical resistivity (20 oC): 68 microOhm cm

    Melting point: 1176 oC
    Boiling point: 2011 oC

    Heat of fusion: 14.4 kJ/mol
    Heat of vaporization: 238.5 kJ/mol
    Heat of atomization: 266 kJ/mol
EOF
fi
if [[ $ELEMENT = "ar" ]]; then
cat <<EOF

      Ar

    Relative atomic mass: 39.948 +- 0.001

    English: Argon
    French: Argon
    Croatian: Argon
    German: Argon
    Italian: Argo
    Spanish: Argon

    Atomic number: 18
    Group numbers: 18
    Period: 3
    Standard state (20 oC): gas

    Discovery: 1894 Lord Raleigh, Sir William Ramsay (GB)

Argon was discovered by Lord Raleigh and Sir William Ramsay (GB) in
1894. The origin of the name comes from the Greek word 'argos' meaning
'inactive'. It is a colourless and odourless noble gas, chemically
inert. Argon is the third most abundant element in the earth's
atmosphere and makes up about 1%. Argon is continuously released into
the air by decay of radioactive potassium-40. Pure form is obtained from
fractional distillation of liquid air. It is used in lighting products,
and is often used in filling incandescent light bulbs. Some is mixed
with krypton in fluorescent lamps. Crystals in the semiconductor
industry are grown in argon atmospheres.

    Electronic configuration: [Ne] 3s2 3p6
    Formal oxidation number: 0
    Atomic radius: 188 pm

    Electronegativities: -
    Thermal conductivity: 0.0179 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -189.34 oC
    Boiling point: -185.89 oC

    Heat of fusion: 1.21 kJ/mol
    Heat of vaporization: 6.53 kJ/mol
    Heat of atomization: 0 kJ/mol
EOF
fi
if [[ $ELEMENT = "as" ]]; then
cat <<EOF

      As

    Relative atomic mass: 74.92160 +- 0.00002

    English: Arsenic
    French: Arsenic
    Croatian: Arsen
    German: Arsen
    Italian: Arsenico
    Spanish: Arsenico

    Atomic number: 33
    Group numbers: 15
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1250 Albertus Magnus (DE)

Arsenic was discovered by Albertus Magnus (DE) in 1250. The origin of
the name comes from the Greek word 'arsenikon' meaning 'yellow
orpiment'. It is a steel-grey, brittle semi-metal that resists water,
acids and alkalis. It tarnishes in air, burns in oxygen and is highly
toxic by inhalation or ingestion. Arsenic is found in mispickel
(arsenopyrite). Many of its compounds are deadly poison and used as weed
killer and rat poison. Some compounds, called arsenides, are used in the
manufacture of paints, wallpapers and ceramics. It is also used in
semiconductors

    Electronic configuration: [Ar] 3d10 4s2 4p3
    Formal oxidation number: -3 +3 +5
    Atomic radius: 124.5 pm

    Electronegativities: 2.18
    Thermal conductivity: 50 W/(m K)
    Electrical resistivity (20 oC): 33.3 microOhm cm

    Melting point: 817 oC
    Boiling point: 614 oC

    Heat of fusion: 27.7 kJ/mol
    Heat of vaporization: 31.9 kJ/mol
    Heat of atomization: 301.42 kJ/mol
EOF
fi
if [[ $ELEMENT = "at" ]]; then
cat <<EOF

      At

    Relative atomic mass: [210]

    English: Astatine
    French: Astate
    Croatian: Astat
    German: Astat
    Italian: Astato
    Spanish: Astato

    Atomic number: 85
    Group numbers: 17
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1940 Emilio Segre, Dale Raymond Corson, Kenneth Ross Mackenzie (US)

Astatine was discovered by Emilio Segre, Dale Raymond Corson, and
Kenneth Ross Mackenzie (US) in 1940. The origin of the name comes from
the Greek word 'astatos' meaning 'unstable'. It is a unstable,
radioactive member of the halogen group. Astatine does not occur in
nature, it is similar to iodine. Astatine is produced by bombarding
bismuth with alpha particles. Since its isotopes have such short
half-lives there are no commercially significant compounds of astatine.

    Electronic configuration: [Xe] 4f14 5d10 6s2 6p5
    Formal oxidation number: 
    Atomic radius: 145 pm

    Electronegativities: 2.2
    Thermal conductivity: 1.7 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 302 oC
    Boiling point: 337 oC

    Heat of fusion: 23.8 kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 91 kJ/mol
EOF
fi
if [[ $ELEMENT = "au" ]]; then
cat <<EOF

      Au

    Relative atomic mass: 196.966569 +- 0.000004

    English: Gold
    French: Or
    Croatian: Zlato
    German: Gold
    Italian: Oro
    Spanish: Oro

    Atomic number: 79
    Group numbers: 11
    Period: 6
    Standard state (20 oC): solid

    Discovery: - -

Gold has been known since ancient times. The origin of the name comes
from the Latin word 'aurum' meaning 'gold'. It is a soft, malleable,
bright yellow metal that is unaffected by air, water, alkalis and most
acids. Gold is found in veins in the crust, with copper ore and native.
It is used in electronics, jewellery and coins. It is a good reflector
of infrared radiation, so a thin film of gold is applied to the glass of
skyscrapers to reduce internal heating from sunlight.

    Electronic configuration: [Xe] 4f14 5d10 6s1
    Formal oxidation number: +1 +3
    Atomic radius: 144.2 pm

    Electronegativities: 2.4
    Thermal conductivity: 317 W/(m K)
    Electrical resistivity (20 oC): 2.35 microOhm cm

    Melting point: 1064.18 oC
    Boiling point: 2856 oC

    Heat of fusion: 12.7 kJ/mol
    Heat of vaporization: 343.1 kJ/mol
    Heat of atomization: 365.93 kJ/mol
EOF
fi
if [[ $ELEMENT = "ba" ]]; then
cat <<EOF

      Ba

    Relative atomic mass: 137.327 +- 0.007

    English: Barium
    French: Baryum
    Croatian: Barij
    German: Barium
    Italian: Bario
    Spanish: Bario

    Atomic number: 56
    Group numbers: 2
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1808 Sir Humphry Davy (GB)

Barium was discovered by Sir Humphry Davy (GB) in 1808. The origin of
the name comes from the Greek word 'barys' meaning 'heavy'. It is a
soft, slightly malleable, silvery-white metal. Barium oxidises in air
and reacts with water. Soluble compounds are toxic by ingestion. Barium
is found in barytine (BaSO4) and witherite (BaCO3), it is never found in
pure form due to its reactivity. Barium must be stored under kerosene to
remain pure. Barite, or barium sulfate (BaSO4) is used as a filter for
rubber, plastics and resins. It is insoluble in water and so is used in
X-rays of the digestive system. Barium nitrate, Ba(NO3)2, burns
brilliant green and is used in fireworks.

    Electronic configuration: [Xe] 6s2
    Formal oxidation number: +2
    Atomic radius: 217.4 pm

    Electronegativities: 0.89
    Thermal conductivity: 18.4 W/(m K)
    Electrical resistivity (20 oC): 50 microOhm cm

    Melting point: 727 oC
    Boiling point: 1897 oC

    Heat of fusion: 7.66 kJ/mol
    Heat of vaporization: 150.9 kJ/mol
    Heat of atomization: 180.7 kJ/mol
EOF
fi
if [[ $ELEMENT = "be" ]]; then
cat <<EOF

      Be

    Relative atomic mass: 9.012182 +- 0.000003

    English: Beryllium
    French: Beryllium
    Croatian: Berilij
    German: Beryllium
    Italian: Berillio
    Spanish: Berilio

    Atomic number: 4
    Group numbers: 2
    Period: 2
    Standard state (20 oC): solid

    Discovery: 1798 Louis-Nicholas Vauquelin (FR)

Beryllium was discovered by Louis-Nicholas Vauquelin (FR) in 1798. The
origin of the name comes from the Greek word 'beryllos' meaning mineral
'beryl'; also called glucinium from the Greek word 'glykys' meaning
'sweet'. It is a steel-grey metal resistant to attack by concentrated
nitric acid. It has excellent thermal conductivity and is nonmagnetic.
At ordinary temperatures, it resists oxidation in air. Beryllium and its
salts are toxic and should be handled with the greatest of care.
Beryllium is found mostly in minerals like beryl [AlBe3(Si6O18)] and
chrysoberyl (Al2BeO4). Pure beryllium is obtained by chemically reducing
beryl mineral and by electrolysis of beryllium chloride. Its ability to
absorb large amounts of heat makes it useful in spacecrafts, missiles,
aircrafts, etc. Emeralds are beryl crystals with chromium traces giving
them their green colour.

    Electronic configuration: [He] 2s2
    Formal oxidation number: +2
    Atomic radius: 111.3 pm

    Electronegativities: 1.57
    Thermal conductivity: 200 W/(m K)
    Electrical resistivity (20 oC): 4 microOhm cm

    Melting point: 1287 oC
    Boiling point: 2471 oC

    Heat of fusion: 9.8 kJ/mol
    Heat of vaporization: 308.8 kJ/mol
    Heat of atomization: 320.3 kJ/mol
EOF
fi
if [[ $ELEMENT = "bh" ]]; then
cat <<EOF

      Bh

    Relative atomic mass: [272]

    English: Bohrium
    French: Bohrium
    Croatian: Bohrij
    German: Bohrium
    Italian: Bohrio
    Spanish: Bohrio

    Atomic number: 107
    Group numbers: 7
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1981 Peter Armbruster, Gottfried Munzenber & GSI Darmstadt (DE)

Bohrium was discovered by Peter Armbruster, Gottfried Munzenber (DE) and
their co-workers at the Heavy Ion Research Laboratory (Gesellschaft fur
Schwerionenforschung, GSI) in Darmstadt, Germany in 1981. Named in
honour of Niels 'Bohr', the Danish physicist. It is a synthetic
radioactive metal. Bohrium was produced by bombarding bismuth-204 with
chromium-54.

    Electronic configuration: [Rn] 5f14 6d5 7s2
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "bi" ]]; then
cat <<EOF

      Bi

    Relative atomic mass: 208.98040 +- 0.00001

    English: Bismuth
    French: Bismuth
    Croatian: Bizmut
    German: Bismut
    Italian: Bismuto
    Spanish: Bismuto

    Atomic number: 83
    Group numbers: 15
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1450 Basil Valentine (DE)

Bismuth was discovered by Basil Valentine (DE) in 1450. The origin of
the name comes from the German words 'Weisse Masse' meaning 'white
mass'; now spelled 'wismut' and 'bisemutum'. It is a hard, brittle,
steel-grey metal with a pink tint. It is stable in oxygen and water but
dissolves in concentrated nitric acid. Bismuth can be found free in
nature and in minerals like bismuthine (Bi2S3) and in bismuth ochre
(Bi2O3) Main use is in pharmaceuticals and low melting point alloys used
as fuses.

    Electronic configuration: [Xe] 4f14 5d10 6s2 6p3
    Formal oxidation number: +3 +5
    Atomic radius: 154.5 pm

    Electronegativities: 1.9
    Thermal conductivity: 7.87 W/(m K)
    Electrical resistivity (20 oC): 106.8 microOhm cm

    Melting point: 271.4 oC
    Boiling point: 1564 oC

    Heat of fusion: 10.48 kJ/mol
    Heat of vaporization: 179.1 kJ/mol
    Heat of atomization: 207.36 kJ/mol
EOF
fi
if [[ $ELEMENT = "bk" ]]; then
cat <<EOF

      Bk

    Relative atomic mass: [247]

    English: Berkelium
    French: Berkelium
    Croatian: Berkelij
    German: Berkelium
    Italian: Berkelio
    Spanish: Berkelio

    Atomic number: 97
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1949 Stanley G. Thompson, Albert Ghiorso, Glenn T. Seaborg (US)

Berkelium was discovered by Stanley G. Thompson, Albert Ghiorso, and
Glenn T. Seaborg (US) in 1949. Named after 'Berkeley', a city in
California, home of the University of California, USA. It is synthetic
radioactive metal. Berkelium was made by bombarding americium with alpha
particles.

    Electronic configuration: [Rn] 5f9 7s2
    Formal oxidation number: +3 +4
    Atomic radius: 170 pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 1050 oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 291 kJ/mol
EOF
fi
if [[ $ELEMENT = "b" ]]; then
cat <<EOF
EOF
fi
if [[ $ELEMENT = "br" ]]; then
cat <<EOF

      Br

    Relative atomic mass: 79.904 +- 0.001

    English: Bromine
    French: Brome
    Croatian: Brom
    German: Brom
    Italian: Bromo
    Spanish: Bromo

    Atomic number: 35
    Group numbers: 17
    Period: 4
    Standard state (20 oC): liquid

    Discovery: 1826 Antoine-Jerome Balard (FR)

Bromine was discovered by Antoine-Jerome Balard (FR) in 1826. The origin
of the name comes from the Greek word 'bromos' meaning 'stench'. It is a
reddish-brown liquid with suffocating, irritating fumes that gives off
poisonous vapour. It is a oxidizer that causes severe burns. Bromine
occurs in compounds in sea water. It was once used in large quantities
to make a compound that removed lead compound build up in engines
burning leaded gasoline. Now it is primarily used in dyes, disinfectants
and photographic chemicals.

    Electronic configuration: [Ar] 3d10 4s2 4p5
    Formal oxidation number: -1 +1 +5
    Atomic radius: 114.5 pm

    Electronegativities: 2.96
    Thermal conductivity: 0.0047 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -7.2 oC
    Boiling point: 58.78 oC

    Heat of fusion: 10.8 kJ/mol
    Heat of vaporization: 30.5 kJ/mol
    Heat of atomization: 117.943 kJ/mol
EOF
fi
if [[ $ELEMENT = "ca" ]]; then
cat <<EOF

      Ca

    Relative atomic mass: 40.078 +- 0.004

    English: Calcium
    French: Calcium
    Croatian: Kalcij
    German: Calcium
    Italian: Calcio
    Spanish: Calcio

    Atomic number: 20
    Group numbers: 2
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1808 Sir Humphry Davy (GB)

Calcium was discovered by Sir Humphry Davy (GB) in 1808. The origin of
the name comes from the Latin word 'calx' meaning 'lime'. It is a fairly
hard, silvery-white metal. Exposed surfaces form oxides and nitrides.
Calcium reacts with water and oxygen. It only occurs in compounds.
Calcium is obtained from minerals like chalk, limestone and marble. Pure
metal is produced by replacing the calcium in lime (CaCO3) with
aluminium in hot, low pressure retorts. Calcium is used by many forms of
life to make shells and bones, as a pure metal it has little use,
however two of its compounds, lime (CaO) and gypsum (CaSO4), are in
great demand by a number of industries.

    Electronic configuration: [Ar] 4s2
    Formal oxidation number: +2
    Atomic radius: 197.4 pm

    Electronegativities: 1
    Thermal conductivity: 190 W/(m K)
    Electrical resistivity (20 oC): 3.91 microOhm cm

    Melting point: 842 oC
    Boiling point: 1484 oC

    Heat of fusion: 9.33 kJ/mol
    Heat of vaporization: 150.6 kJ/mol
    Heat of atomization: 177.74 kJ/mol
EOF
fi
if [[ $ELEMENT = "cd" ]]; then
cat <<EOF

      Cd

    Relative atomic mass: 112.411 +- 0.008

    English: Cadmium
    French: Cadmium
    Croatian: Kadmij
    German: Kadmium
    Italian: Cadmio
    Spanish: Cadmio

    Atomic number: 48
    Group numbers: 12
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1817 Friedrich Strohmeyer (DE)

Cadmium was discovered by Friedrich Strohmeyer (DE) in 1817. The origin
of the name comes from the Latin word 'cadmia' meaning 'calamine' (zinc
carbonate, ZnCO3), or from the Greek word 'kadmeia' with the same
meaning. It is a soft, malleable, blue-white metal that tarnishes in
air, soluble in acids, insoluble in alkalis. Boiling cadmium gives off a
weird, yellow-coloured vapour that is poisonous. Cadmium can cause a
variety of health problems, including kidney failure and high blood
pressure. Cadmium is obtained as a by product of zinc refining. The
mayor use of cadmium is in electroplating of steel to protect it from
corrosion. It is also used to make nickel-cadmium batteries. The ability
of cadmium to adsorb neutrons has made it of great importance in the
design of nuclear reactors. Its compounds are found in paint pigments
and a wide variety of intense colours.

    Electronic configuration: [Kr] 4d10 5s2
    Formal oxidation number: +2
    Atomic radius: 148.9 pm

    Electronegativities: 1.69
    Thermal conductivity: 96.8 W/(m K)
    Electrical resistivity (20 oC): 6.83 microOhm cm

    Melting point: 312.07 oC
    Boiling point: 767 oC

    Heat of fusion: 6.11 kJ/mol
    Heat of vaporization: 100 kJ/mol
    Heat of atomization: 112.05 kJ/mol
EOF
fi
if [[ $ELEMENT = "ce" ]]; then
cat <<EOF

      Ce

    Relative atomic mass: 140.116 +- 0.001

    English: Cerium
    French: Cerium
    Croatian: Cerij
    German: Cer
    Italian: Cerio
    Spanish: Cerio

    Atomic number: 58
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1803 Jons Jakob Berzelius, Wilhelm Hisinger (SE); Martin Heinrich Klaproth (DE)

Cerium was discovered by Jons Jakob Berzelius and Wilhelm Hisinger (SE)
in 1803 and independently by Martin Heinrich Klaproth (DE). Named after
the asteroid 'Ceres' discovered two years before the element. It is a
malleable, ductile, iron-grey metal that tarnishes in air and reacts
easily with water. Cerium dissolves in acids and ignites when heated.
Metal ignites and burns readily. Strong reductant. Cerium is most
abundant rare earth metal. Found in many minerals like monazite sand
[Ce(PO4)]. Its oxides are used in the optics and glass-making
industries. Its salts are used in the photography and textile industry.
Cerium is also used in high-intensity carbon lamps and as alloying
agents in special metals.

    Electronic configuration: [Xe] 4f2 6s2
    Formal oxidation number: +3 +4
    Atomic radius: 182.5 pm

    Electronegativities: 1.12
    Thermal conductivity: 11.4 W/(m K)
    Electrical resistivity (20 oC): 75 microOhm cm

    Melting point: 798 oC
    Boiling point: 3443 oC

    Heat of fusion: 8.87 kJ/mol
    Heat of vaporization: 398 kJ/mol
    Heat of atomization: 423.4 kJ/mol
EOF
fi
if [[ $ELEMENT = "cf" ]]; then
cat <<EOF

      Cf

    Relative atomic mass: [251]

    English: Californium
    French: Californium
    Croatian: Kalifornij
    German: Californium
    Italian: Californio
    Spanish: Californio

    Atomic number: 98
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1950 Stanley G. Thompson, Kenneth Street Jr., Albert Ghiorso, Glenn T. Seaborg (US)

Californium was discovered by Stanley G. Thompson, Kenneth Street Jr.,
and Albert Ghiorso (US) in 1950. Named after the State and University of
'California', USA. It is a synthetic radioactive metal and a powerful
neutron emitter. Californium was made by bombarding curium with helium
ions.

    Electronic configuration: [Rn] 5f10 7s2
    Formal oxidation number: +3
    Atomic radius: 186 pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 900 oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 175 kJ/mol
EOF
fi
if [[ $ELEMENT = "cl" ]]; then
cat <<EOF

      Cl

    Relative atomic mass: 35.453 +- 0.002

    English: Chlorine
    French: Chlore
    Croatian: Klor
    German: Chlor
    Italian: Cloro
    Spanish: Cloro

    Atomic number: 17
    Group numbers: 17
    Period: 3
    Standard state (20 oC): gas

    Discovery: 1774 Carl William Scheele (SE)

Chlorine was discovered by Carl William Scheele (SE) in 1774. The origin
of the name comes from the Greek word 'chloros' meaning 'pale green'. It
is a greenish-yellow, disagreeable gas with irritating odour. The gas is
toxic and severe irritant by contact or inhalation. It's Never found in
free form in nature. Commercial quantities of chlorine are produced by
electrolysis of aqueous sodium chloride (NaCl) from seawater or brine
from salt mines. Sulfur is used in water purification, bleaches, acids
and many, many other compounds such as chlorofluorocarbons (CFC).

    Electronic configuration: [Ne] 3s2 3p5
    Formal oxidation number: -1 +1 +5 +7
    Atomic radius: 99.4 pm

    Electronegativities: 3.16
    Thermal conductivity: 0.0089 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -101.5 oC
    Boiling point: -34.04 oC

    Heat of fusion: 6.41 kJ/mol
    Heat of vaporization: 20.4033 kJ/mol
    Heat of atomization: 120 kJ/mol
EOF
fi
if [[ $ELEMENT = "c" ]]; then
cat <<EOF

      C

    Relative atomic mass: 12.0107 +- 0.0008

    English: Carbon
    French: Carbone
    Croatian: Ugljik
    German: Kohlenstoff
    Italian: Carbonio
    Spanish: Carbono

    Atomic number: 6
    Group numbers: 14
    Period: 2
    Standard state (20 oC): solid

    Discovery: - -

Carbon has been known since ancient times. The origin of the name comes
from the Latin word 'carbo' meaning 'charcoal'. Carbon has three forms:
graphite, diamond and c60. Graphite form of carbon is a black,
odourless, slippery solid and sublimes at 3825 °C. Diamond form is a
clear or coloured; an extremely hard solid. C60 is Buckminsterfullerine.
Carbon black burns readily with oxidants. Carbon is made by burning
organic compounds with insufficient oxygen. There are close to ten
million known carbon compounds, many thousands of which are vital to
organic and life processes. Radiocarbon dating uses the carbon-14
isotope to date old objects.

    Electronic configuration: [He] 2s2 2p2
    Formal oxidation number: -4 +2 +4
    Atomic radius: 77.2 pm

    Electronegativities: 2.55
    Thermal conductivity: 5.7 W/(m K)
    Electrical resistivity (20 oC): 1375 microOhm cm

    Melting point: 3550 oC
    Boiling point: 4827 oC

    Heat of fusion: 105 kJ/mol
    Heat of vaporization: 710.9 kJ/mol
    Heat of atomization: 711.2 kJ/mol
EOF
fi
if [[ $ELEMENT = "cm" ]]; then
cat <<EOF

      Cm

    Relative atomic mass: [247]

    English: Curium
    French: Curium
    Croatian: Kurij
    German: Curium
    Italian: Curio
    Spanish: Curio

    Atomic number: 96
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1944 Glenn T. Seaborg, Ralph A. James, Albert Ghiorso (US)

Curium was discovered by Glenn T. Seaborg, Ralph A. James, and Albert
Ghiorso (US) in 1944. Named in honour of Pierre and Marie 'Curie'. It is
a silvery, malleable, synthetic radioactive metal. So radioactive it
glows in the dark. Curium was made by bombarding plutonium with helium
ions.

    Electronic configuration: [Rn] 5f7 6d1 7s2
    Formal oxidation number: +3
    Atomic radius: 174 pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 1345 oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 382 kJ/mol
EOF
fi
if [[ $ELEMENT = "cn" ]]; then
cat <<EOF

      Cn

    Relative atomic mass: [285]

    English: Copernicium
    French: Copernicium
    Croatian: Kopernicij
    German: Copernicium
    Italian: Copernicio
    Spanish: Copernicio

    Atomic number: 112
    Group numbers: 12
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1996 Sigurd Hofmann & GSI Darmstadt (DE)

Copernicium was discovered by S. Hofmann (DE) et al. collaboration at
the Heavy Ion Research Laboratory (Gesellschaft fur
Schwerionenforschung, GSI) in Darmstadt, Germany in February 1996. Named
in honour of Nicolaus *Copernicus*, the Polish astronomer and
mathematician. Copernicium was created by bombarding the lead-208 nuclei
with accelerated zinc-70 nuclei in a heavy ion accelerator.

    Electronic configuration: [Rn] 5f14 6d10 7s2
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "co" ]]; then
cat <<EOF

      Co

    Relative atomic mass: 58.933195 +- 0.000005

    English: Cobalt
    French: Cobalt
    Croatian: Kobalt
    German: Kobalt
    Italian: Cobalto
    Spanish: Cobalto

    Atomic number: 27
    Group numbers: 9
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1739 Georg Brandt (DE)

Cobalt was discovered by Georg Brandt (DE) in 1739. The origin of the
name comes from the German word 'kobald' meaning 'goblin' or evil
spirit. It is a hard, ductile, lustrous bluish-grey metal and it's
surfaces are stable in air. Cobalt reacts over time with dilute acids
and has remarkable magnetic properties. Cobalt occurs in compounds with
arsenic and sulfur as in cobaltine (CoAsS) and linneite (Co3S4). Pure
cobalt is obtained as a by-product of refining nickel, copper and iron.
Cobalt is used in many hard alloys; for magnets, ceramics and special
glasses. Radioactive cobalt-60 is used in cancer therapy.

    Electronic configuration: [Ar] 3d7 4s2
    Formal oxidation number: +2 +3
    Atomic radius: 125.3 pm

    Electronegativities: 1.88
    Thermal conductivity: 100 W/(m K)
    Electrical resistivity (20 oC): 6.24 microOhm cm

    Melting point: 1495 oC
    Boiling point: 2927 oC

    Heat of fusion: 15.2 kJ/mol
    Heat of vaporization: 382.4 kJ/mol
    Heat of atomization: 423.082 kJ/mol
EOF
fi
if [[ $ELEMENT = "cr" ]]; then
cat <<EOF

      Cr

    Relative atomic mass: 51.9961 +- 0.0006

    English: Chromium
    French: Chrome
    Croatian: Krom
    German: Chrom
    Italian: Cromo
    Spanish: Cromo

    Atomic number: 24
    Group numbers: 6
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1797 Louis-Nicholas Vauquelin (FR)

Chromium was discovered by Louis-Nicholas Vauquelin (FR) in 1797. The
origin of the name comes from the Greek word 'chroma' meaning 'colour'.
It is a very hard, crystalline, steel-grey metal. The pure metal has a
blue-white colour. It is hard, brittle and corrosion-resistant at normal
temperatures. Hexavalent compounds are toxic by skin contact. The most
important chromium mineral is chromite [Fe,Mg(CrO4)]. It is produced
commercially by heating its ore in the presence of silicon or aluminium.
Chromium is used to make stainless steel; it gives the colour to rubies
and emeralds. Iron-nickel-chromium alloys in various percentages yield
an incredible variety of the most important metals in modern technology.

    Electronic configuration: [Ar] 3d5 4s1
    Formal oxidation number: +2 +3 +6
    Atomic radius: 124.9 pm

    Electronegativities: 1.66
    Thermal conductivity: 93.7 W/(m K)
    Electrical resistivity (20 oC): 12.9 microOhm cm

    Melting point: 1907 oC
    Boiling point: 2671 oC

    Heat of fusion: 15.3 kJ/mol
    Heat of vaporization: 341.8 kJ/mol
    Heat of atomization: 394.51 kJ/mol
EOF
fi
if [[ $ELEMENT = "cs" ]]; then
cat <<EOF

      Cs

    Relative atomic mass: 132.9054519 +- 0.0000002

    English: Caesium (Cesium)
    French: Cesium
    Croatian: Cezij
    German: Casium
    Italian: Cesio
    Spanish: Cesio

    Atomic number: 55
    Group numbers: 1
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1860 Robert Wilhelm Bunsen, Gustav Robert Kirchhoff (DE)

Caesium (or cesium) was discovered by Robert Wilhelm Bunsen and Gustav
Robert Kirchhoff (DE) in 1860. The origin of the name comes from the
Latin word 'caesius' meaning 'sky blue' or 'heavenly blue'. It is a very
soft, light grey, ductile metal that reacts readily with oxygen and
reacts explosively with water. Caesium is found in pollucite
[(Cs4Al4Si9O26).H2O] and as trace in lepidolite. It is used as a
'getter' to remove air traces in vacuum and cathode-ray tubes, in
producing photoelectric devices and atomic clocks. Since it ionises
readily, it is used as an ion rocket motor propellant.

    Electronic configuration: [Xe] 6s1
    Formal oxidation number: +1
    Atomic radius: 265.5 pm

    Electronegativities: 0.79
    Thermal conductivity: 35.9 W/(m K)
    Electrical resistivity (20 oC): 20 microOhm cm

    Melting point: 28.44 oC
    Boiling point: 671 oC

    Heat of fusion: 2.09 kJ/mol
    Heat of vaporization: 66.5 kJ/mol
    Heat of atomization: 77.58 kJ/mol
EOF
fi
if [[ $ELEMENT = "cu" ]]; then
cat <<EOF

      Cu

    Relative atomic mass: 63.546 +- 0.003

    English: Copper
    French: Cuivre
    Croatian: Bakar
    German: Kupfer
    Italian: Rame
    Spanish: Cobre

    Atomic number: 29
    Group numbers: 11
    Period: 4
    Standard state (20 oC): solid

    Discovery: - -

Copper has been known since ancient times. The origin of the name comes
from the Latin word 'cuprum' meaning the island of 'Cyprus' famed for
its copper mines. It is a malleable, ductile, reddish-brown metal,
resistant to air and water. Exposed surfaces form greenish carbonate
film. Pure copper occurs rarely in nature. It is usually found in
sulfides as in chalcopyrite (CuFeS2), coveline (CuS), chalcosine (Cu2S)
or oxides like cuprite (Cu2O). Copper is most often used as an
electrical conductor and in the manufacture of water pipes. Its alloys
are used in jewellery and for coins.

    Electronic configuration: [Ar] 3d10 4s1
    Formal oxidation number: +1 +2
    Atomic radius: 127.8 pm

    Electronegativities: 1.9
    Thermal conductivity: 401 W/(m K)
    Electrical resistivity (20 oC): 1.673 microOhm cm

    Melting point: 1084.62 oC
    Boiling point: 2562 oC

    Heat of fusion: 13 kJ/mol
    Heat of vaporization: 306.7 kJ/mol
    Heat of atomization: 337.15 kJ/mol
EOF
fi
if [[ $ELEMENT = "db" ]]; then
cat <<EOF

      Db

    Relative atomic mass: [268]

    English: Dubnium
    French: Dubnium
    Croatian: Dubnij
    German: Dubnium
    Italian: Dubnio
    Spanish: Dubnio

    Atomic number: 105
    Group numbers: 5
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1967 Albert Ghiorso & Berkely Lab. (US), Georgy Nikolaevich Flerov & JINR Dubna (RU)

Dubnium was discovered by workers at the Nuclear Institute at Dubna (RU)
and by workers at the University of California, Berkeley (US) in 1967.
The origin of the name dubnium is the Joint Nuclear Institute at
'Dubna', Russia, an institute heavily involved in the search for heavy
elements. It is a synthetic radioactive metal. Dubnium was made by
bombarding californium-249 with a beam of nitrogen-15 ions. There are
now five known isotopes of dubnium. The longest-lived is dubnium-262,
with a half-life of 34 seconds.

    Electronic configuration: [Rn] 5f14 6d3 7s2
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "ds" ]]; then
cat <<EOF
EOF
fi
if [[ $ELEMENT = "dy" ]]; then
cat <<EOF

      Dy

    Relative atomic mass: 162.500 +- 0.001

    English: Dysprosium
    French: Dysprosium
    Croatian: Disprozij
    German: Dysprosium
    Italian: Disprosio
    Spanish: Disprosio

    Atomic number: 66
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1886 Paul-Emile Lecoq de Boisbaudran (FR)

Dysprosium was discovered by Paul-Emile Lecoq de Boisbaudran (FR) in
1886. The origin of the name comes from the Greek word 'dysprositos'
meaning 'hard to obtain'. It is a soft, lustrous, silvery metal that
reacts with oxygen and water. Dysprosium is a reductant and dissolves in
acids. Metal ignites and burns readily. Dysprosium is usually found with
erbium, holmium and other rare earths in some minerals such as monazite
sand. Dysprosium uses are limited to the experimental and esoteric. Some
isotopes of dysprosium are effective absorbers of thermal neutrons and
are being considered for use in the control rods in nuclear reactors.

    Electronic configuration: [Xe] 4f10 6s2
    Formal oxidation number: +3
    Atomic radius: 175.2 pm

    Electronegativities: 1.22
    Thermal conductivity: 10.7 W/(m K)
    Electrical resistivity (20 oC): 57 microOhm cm

    Melting point: 1412 oC
    Boiling point: 2567 oC

    Heat of fusion: 17.2 kJ/mol
    Heat of vaporization: 293 kJ/mol
    Heat of atomization: 293.05 kJ/mol
EOF
fi
if [[ $ELEMENT = "er" ]]; then
cat <<EOF

      Er

    Relative atomic mass: 167.259 +- 0.003

    English: Erbium
    French: Erbium
    Croatian: Erbij
    German: Erbium
    Italian: Erbio
    Spanish: Erbio

    Atomic number: 68
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1843 Carl Gustav Mosander (SE)

Erbium was discovered by Carl Gustaf Mosander (SE) in 1843. Named after
'Ytterby', a village in Sweden. It is a soft, malleable, silvery metal
that reacts slowly with water and dissolves in acids. Metal ignites and
burns readily. Erbium is found with other heavier rare earths in
xenotime and euxenite. Erbium oxide is used in ceramics to obtain a pink
glaze. There are also a few uses in the nuclear industry and as an
alloying agent for other exotic metals.

    Electronic configuration: [Xe] 4f12 6s2
    Formal oxidation number: +3
    Atomic radius: 173.4 pm

    Electronegativities: 1.24
    Thermal conductivity: 14.3 W/(m K)
    Electrical resistivity (20 oC): 107 microOhm cm

    Melting point: 1529 oC
    Boiling point: 2868 oC

    Heat of fusion: 17.2 kJ/mol
    Heat of vaporization: 280 kJ/mol
    Heat of atomization: 318.32 kJ/mol
EOF
fi
if [[ $ELEMENT = "es" ]]; then
cat <<EOF

      Es

    Relative atomic mass: [252]

    English: Einsteinium
    French: Einsteinium
    Croatian: Einsteinij
    German: Einsteinium
    Italian: Einsteinio
    Spanish: Einsteinio

    Atomic number: 99
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1952 Albert Ghiorso & Berkely Lab. (US)

Einsteinium was discovered by Albert Ghiorso & Berkely Lab. (US) in
1952. Named in honour of Albert 'Einstein'. It is a synthetic
radioactive metal. Einsteinium was made by bombarding uranium with
neutrons.

    Electronic configuration: [Rn] 5f11 7s2
    Formal oxidation number: +3
    Atomic radius: 186 pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 860 oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 150 kJ/mol
EOF
fi
if [[ $ELEMENT = "eu" ]]; then
cat <<EOF

      Eu

    Relative atomic mass: 151.964 +- 0.001

    English: Europium
    French: Europium
    Croatian: Europij
    German: Europium
    Italian: Europio
    Spanish: Europio

    Atomic number: 63
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1896 Eugene-Anatole Demarcay (FR)

Europium was discovered by Eugene-Anatole Demarcay (FR) in 1896. Named
for the continent of 'Europe'. It is a soft, silvery-white metal that is
extremely reactive with oxygen and water. Europium is obtained from
monazite sand, which is a mixture of phosphates of calcium, thorium,
cerium and most other rare earths. It is used with yttrium oxide to make
red phosphors for colour televisions.

    Electronic configuration: [Xe] 4f7 6s2
    Formal oxidation number: +2 +3
    Atomic radius: 199.5 pm

    Electronegativities: -
    Thermal conductivity: 13.9 W/(m K)
    Electrical resistivity (20 oC): 90 microOhm cm

    Melting point: 822 oC
    Boiling point: 1529 oC

    Heat of fusion: 10.5 kJ/mol
    Heat of vaporization: 176 kJ/mol
    Heat of atomization: 177.11 kJ/mol
EOF
fi
if [[ $ELEMENT = "fe" ]]; then
cat <<EOF

      Fe

    Relative atomic mass: 55.845 +- 0.002

    English: Iron
    French: Fer
    Croatian: Zeljezo
    German: Eisen
    Italian: Ferro
    Spanish: Hierro

    Atomic number: 26
    Group numbers: 8
    Period: 4
    Standard state (20 oC): solid

    Discovery: - -

Iron has been known since ancient times. The origin of the name comes
from the Latin word 'ferrum' meaning 'iron'. It is a malleable,
ferromagnetic, ductile, silvery-white metal. Exposed surfaces form
red-brown oxides. Iron forms very strong alloys (steel). Iron dust
flammable. It's the Fourth most abundant element in the earth's crust.
Iron is obtained from iron ores. Pure metal is produced in blast
furnaces by layering limestone, coke and iron ore and forcing hot gasses
into the bottom. This heats the coke red hot and the iron is reduced
from its oxides and liquefied where it flows to the bottom. Iron is the
most common metal in human society. More than 90% of all metal refined
in the world is iron. It is used in steel and other alloys. Iron is the
chief constituent of hemoglobin which carries oxygen in blood vessels.
It's oxides are used in magnetic tapes and disks.

    Electronic configuration: [Ar] 3d6 4s2
    Formal oxidation number: +2 +3
    Atomic radius: 124.1 pm

    Electronegativities: 1.83
    Thermal conductivity: 80.2 W/(m K)
    Electrical resistivity (20 oC): 9.71 microOhm cm

    Melting point: 1538 oC
    Boiling point: 2861 oC

    Heat of fusion: 14.9 kJ/mol
    Heat of vaporization: 340.2 kJ/mol
    Heat of atomization: 413.96 kJ/mol
EOF
fi
if [[ $ELEMENT = "fl" ]]; then
cat <<EOF

      Fl

    Relative atomic mass: [287]

    English: Flerovium
    French: Flerovium
    Croatian: Flerovij
    German: Flerovium
    Italian: Flerovio
    Spanish: Flerovio

    Atomic number: 114
    Group numbers: 14
    Period: 7
    Standard state (20 oC): solid

    Discovery: 2004 Yuri Oganessian & JINR Dubna (RU), Kenton Moody & LLNL Livermore

Both Flerovium and Livermorium were detected in Russian labs over ten
years ago (1998 and 2000), but the half-lives of the particles were so
short that the scientists were unable to verify their discoveries. The
discoveries were confirmed in 2004 through a collaborative effort
scientists from the Joint Institute for Nuclear Research (JINR) in
Dubna, Rusia, and the Lawrence Livermore National Laboratory (LLNL) in
Livermore, California, USA, led by Rusian physicist Yuri Tsolakovich
Oganessian (1933-) and American chemist Kenton J. (Ken) Moody. The
Dubna-Livermore collaboration be credited with the discovery of the new
element with Z = 114. Temporarily known as ununquadium, flerovium was
named in honor of the Flerov Laboratory of Nuclear Reactions where
superheavy elements are synthesised. The Soviet physicist Georgi
Nikolaevich Flerov (1913-1990) was a pioneer in heavy-ion physics who
founded the JINR in Dubna. It is a synthetic radioactive element that do
not occour naturally in earth. Flerovium was produced by bombarding
plutonium-242 with calcium-48.

    Electronic configuration: [Rn] 5f14 6d10 7s2 7p2
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "f" ]]; then
cat <<EOF

      F

    Relative atomic mass: 18.9984032 +- 0.0000005

    English: Fluorine
    French: Fluor
    Croatian: Fluor
    German: Fluor
    Italian: Fluoro
    Spanish: Fluor

    Atomic number: 9
    Group numbers: 17
    Period: 2
    Standard state (20 oC): gas

    Discovery: 1886 Henri Moissan (FR)

Fluorine was discovered by Henri Moissan (FR) in 1886. The origin of the
name comes from the Latin word 'fluere' meaning 'to flow'. It is a pale
yellow to greenish gas, with an irritating pungent odour. Fluorine is a
extremely reactive, flammable gas. It reacts violently with many
materials. It is toxic by inhalation or ingestion. Fluorine doesn't
occur elementary in nature. Fluorine is found in minerals: fluorite
(CaF2) and cryolite (Na3AlF6). Electrolysis of hydrofluoric acid (HF) or
potassium acid fluoride (KHF2) is the only practical method of
commercial production. It is used in refrigerants, other fluorocarbons
and in toothpaste as sodium fluoride (NaF).

    Electronic configuration: [He] 2s2 2p5
    Formal oxidation number: -1
    Atomic radius: 70.9 pm

    Electronegativities: 3.98
    Thermal conductivity: 0.0256 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -219.62 oC
    Boiling point: -188.12 oC

    Heat of fusion: 1.02 kJ/mol
    Heat of vaporization: 3.26 kJ/mol
    Heat of atomization: 76.9 kJ/mol
EOF
fi
if [[ $ELEMENT = "fm" ]]; then
cat <<EOF

      Fm

    Relative atomic mass: [257]

    English: Fermium
    French: Fermium
    Croatian: Fermij
    German: Fermium
    Italian: Fermio
    Spanish: Fermio

    Atomic number: 100
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1953 Albert Ghiorso & Berkely Lab. (US)

Fermium was discovered by Albert Ghiorso & Berkely Lab. (US) in 1953.
Named in honour of Enrico 'Fermi'. It is a synthetic radioactive metal.
Fermium was produced by bombarding lighter transuranium elements with
still lighter particles or by neutron capture.

    Electronic configuration: [Rn] 5f12 7s2
    Formal oxidation number: +3
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 1527 oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 141 kJ/mol
EOF
fi
if [[ $ELEMENT = "fr" ]]; then
cat <<EOF

      Fr

    Relative atomic mass: [223]

    English: Francium
    French: Francium
    Croatian: Francij
    German: Francium
    Italian: Francio
    Spanish: Francio

    Atomic number: 87
    Group numbers: 1
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1939 Marguerite Perey (FR)

Francium was discovered by Marguerite Perey (FR) in 1939. Named for
'France', the nation of its discovery. It is a highly rare and unstable,
radioactive metal. Its chemical properties are similar to caesium.
Francium is formed from the decay of actinium. It can be produced by
bombarding radium or astatine with neutrons. Since its isotopes have
such short half-lives there are no commercially significant compounds of
francium.

    Electronic configuration: [Rn] 7s1
    Formal oxidation number: +1
    Atomic radius: 282 pm

    Electronegativities: 0.7
    Thermal conductivity: 15 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 27 oC
    Boiling point: 677 oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 75 kJ/mol
EOF
fi
if [[ $ELEMENT = "ga" ]]; then
cat <<EOF

      Ga

    Relative atomic mass: 69.723 +- 0.001

    English: Gallium
    French: Gallium
    Croatian: Galij
    German: Gallium
    Italian: Gallio
    Spanish: Galio

    Atomic number: 31
    Group numbers: 13
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1875 Paul Emile Lecoq de Boisbaudran (FR)

Gallium was discovered by Paul Emile Lecoq de Boisbaudran (FR) in 1875.
The origin of the name comes from the Latin word 'Gallia' meaning
'France'. It is a soft, blue-white metal, stable in air and water that
reacts violently with chlorine and bromine. Gallium is found throughout
the crust in minerals like bauxite, germanite and coal. It is used in
semiconductor production, in making LED's (light-emitting diodes) and
GaAs laser diodes.

    Electronic configuration: [Ar] 3d10 4s2 4p1
    Formal oxidation number: +3
    Atomic radius: 122.1 pm

    Electronegativities: 1.81
    Thermal conductivity: 40.6 W/(m K)
    Electrical resistivity (20 oC): 17.4 microOhm cm

    Melting point: 29.76 oC
    Boiling point: 2204 oC

    Heat of fusion: 5.59 kJ/mol
    Heat of vaporization: 270.3 kJ/mol
    Heat of atomization: 276 kJ/mol
EOF
fi
if [[ $ELEMENT = "gd" ]]; then
cat <<EOF

      Gd

    Relative atomic mass: 157.25 +- 0.03

    English: Gadolinium
    French: Gadolinium
    Croatian: Gadolinij
    German: Gadolinium
    Italian: Gadolinio
    Spanish: Gadolinio

    Atomic number: 64
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1880 Jean Charles Galissard de Marignac (CH)

Gadolinium was discovered by Jean Charles Galissard de Marignac (CH) in
1880. Named after the mineral gadolinite, named for J. 'Gadolin', a
Finnish chemist and mineralogist. It is a soft, ductile, silvery-white
metal that reacts slowly with water and oxygen. Gadolinium dissolves in
acids. The metal ignites and burns readily. Gadolinium is found with
other rare earths in gadolinite and monazite sand. It is used in steel
alloying agents and the manufacture of electronic components.

    Electronic configuration: [Xe] 4f7 5d1 6s2
    Formal oxidation number: +3
    Atomic radius: 178.7 pm

    Electronegativities: 1.2
    Thermal conductivity: 10.6 W/(m K)
    Electrical resistivity (20 oC): 140.5 microOhm cm

    Melting point: 1313 oC
    Boiling point: 3273 oC

    Heat of fusion: 15.5 kJ/mol
    Heat of vaporization: 301 kJ/mol
    Heat of atomization: 398.94 kJ/mol
EOF
fi
if [[ $ELEMENT = "ge" ]]; then
cat <<EOF

      Ge

    Relative atomic mass: 72.64 +- 0.01

    English: Germanium
    French: Germanium
    Croatian: Germanij
    German: Germanium
    Italian: Germanio
    Spanish: Germanio

    Atomic number: 32
    Group numbers: 14
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1886 Clemens Alexander Winkler (DE)

Germanium was discovered by Clemens Alexander Winkler (DE) in 1886. The
origin of the name comes from the Latin word 'Germania' meaning
'Germany'. It is a greyish-white semi-metal, stable in air and water.
Germanium is unaffected by alkalis and most (except nitric) acids.
Germanium is obtained from refining copper, zinc and lead. It is widely
used in semiconductors when combined with tiny amounts of phosphorus,
arsenic, gallium and antimony.

    Electronic configuration: [Ar] 3d10 4s2 4p2
    Formal oxidation number: +2 +4
    Atomic radius: 122.5 pm

    Electronegativities: 2.01
    Thermal conductivity: 59.9 W/(m K)
    Electrical resistivity (20 oC): 46000000 microOhm cm

    Melting point: 938.25 oC
    Boiling point: 2833 oC

    Heat of fusion: 34.7 kJ/mol
    Heat of vaporization: 327.6 kJ/mol
    Heat of atomization: 373.8 kJ/mol
EOF
fi
if [[ $ELEMENT = "he" ]]; then
cat <<EOF

      He

    Relative atomic mass: 4.002602 +- 0.000002

    English: Helium
    French: Helium
    Croatian: Helij
    German: Helium
    Italian: Elio
    Spanish: Helio

    Atomic number: 2
    Group numbers: 18
    Period: 1
    Standard state (20 oC): gas

    Discovery: 1868 Pierre Jules Cesar Janssen (FR); Sir Joseph Norman Lockyer (GB)

Helium was discovered by Pierre Jules Cesar Janssen (FR) and Sir Joseph
Norman Lockyer (GB) in 1868. The origin of the name comes from the Greek
word 'helios' meaning 'sun'. It is a light, odourless, colourless inert
gas. Helium is the second most abundant element in the universe. Helium
is found in natural gas deposits from wells in Texas, Oklahoma and
Kansas. It is used in balloons, deep sea diving and welding and in very
low temperature research.

    Electronic configuration: 1s2
    Formal oxidation number: 0
    Atomic radius: 128 pm

    Electronegativities: -
    Thermal conductivity: 0.155 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -272.2 oC
    Boiling point: -268.93 oC

    Heat of fusion: 0.021 kJ/mol
    Heat of vaporization: 0.082 kJ/mol
    Heat of atomization: 0 kJ/mol
EOF
fi
if [[ $ELEMENT = "hf" ]]; then
cat <<EOF

      Hf

    Relative atomic mass: 178.49 +- 0.02

    English: Hafnium
    French: Hafnium
    Croatian: Hafnij
    German: Hafnium
    Italian: Afnio
    Spanish: Hafnio

    Atomic number: 72
    Group numbers: 4
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1923 Dirk Coster (NL), George Charles von Hevesy (HU)

Hafnium was discovered by Dirk Coster (NL) and George Charles von Hevesy
(HU) in 1923. The origin of the name comes from the Latin name 'Hafnia'
meaning 'Copenhagen'. It is a silvery, ductile, toxic metal that resists
alkalis and acids (except HF). Metal ignites and burns readily and the
exposed surfaces form oxide film. Hafnium is obtained from mineral
zircon or baddeleyite. It is used in reactor control rods because of its
ability to absorb neutrons.

    Electronic configuration: [Xe] 4f14 5d2 6s2
    Formal oxidation number: +4
    Atomic radius: 156.4 pm

    Electronegativities: 1.3
    Thermal conductivity: 23 W/(m K)
    Electrical resistivity (20 oC): 33.08 microOhm cm

    Melting point: 2233 oC
    Boiling point: 4603 oC

    Heat of fusion: 25.5 kJ/mol
    Heat of vaporization: 570.7 kJ/mol
    Heat of atomization: 618.9 kJ/mol
EOF
fi
if [[ $ELEMENT = "hg" ]]; then
cat <<EOF

      Hg

    Relative atomic mass: 200.59 +- 0.02

    English: Mercury
    French: Mercure
    Croatian: Ziva
    German: Quecksilber
    Italian: Mercurio
    Spanish: Mercurio

    Atomic number: 80
    Group numbers: 12
    Period: 6
    Standard state (20 oC): liquid

    Discovery: - -

Mercury has been known since ancient times. The origin of the name comes
from the Latin word 'hydrargyrum' meaning 'liquid silver'. It is a
heavy, silver-white metal, liquid at ordinary temperatures, stable in
air and water. Mercury is unreactive with alkalis and most acids. It
gives off poisonous vapour that has a chronic cumulative effect. Mercury
rarely occurs free in nature. The chief ore is cinnabar or mercury
sulfide (HgS). It is used in thermometers, barometers and batteries,
also in electrical switches and mercury-vapour lighting products.

    Electronic configuration: [Xe] 4f14 5d10 6s2
    Formal oxidation number: +1 +2
    Atomic radius: 150.3 pm

    Electronegativities: 1.9
    Thermal conductivity: 8.34 W/(m K)
    Electrical resistivity (20 oC): 95.8 microOhm cm

    Melting point: -38.83 oC
    Boiling point: 356.73 oC

    Heat of fusion: 2.331 kJ/mol
    Heat of vaporization: 59.11 kJ/mol
    Heat of atomization: 64.463 kJ/mol
EOF
fi
if [[ $ELEMENT = "h" ]]; then
cat <<EOF

      H

    Relative atomic mass: 1.00794 +- 0.00007

    English: Hydrogen
    French: Hydrogene
    Croatian: Vodik
    German: Wasserstoff
    Italian: Idrogeno
    Spanish: Hidrogeno

    Atomic number: 1
    Group numbers: 1
    Period: 1
    Standard state (20 oC): gas

    Discovery: 1766 Sir Henry Cavendish (GB)

Hydrogen was discovered by Sir Henry Cavendish (GB) in 1766. The origin
of the name comes from the Greek words 'hydro' and 'genes' meaning
'water' and 'generate'. It is a colourless, odourless gas which burns
and forms explosive mixtures in air and reacts violently with oxidants.
Hydrogen is the most abundant element in the universe. Commercial
quantities of hydrogen are produced by reacting superheated steam with
methane or carbon. A laboratory method for producing hydrogen is by the
reaction of acids on metals such as zinc or by the electrolysis of
water. Most hydrogen is used in the production of ammonia and in metal
refining. It is also used as fuel in rockets. Its two heavier isotopes
(deuterium and tritium) are used respectively for nuclear fusion.

    Electronic configuration: 1s1
    Formal oxidation number: -1 +1
    Atomic radius: 37.3 pm

    Electronegativities: 2.2
    Thermal conductivity: 0.183 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -259.34 oC
    Boiling point: 252.87 oC

    Heat of fusion: 0.12 kJ/mol
    Heat of vaporization: 0.46 kJ/mol
    Heat of atomization: 216.003 kJ/mol
EOF
fi
if [[ $ELEMENT = "ho" ]]; then
cat <<EOF

      Ho

    Relative atomic mass: 164.93032 +- 0.00002

    English: Holmium
    French: Holmium
    Croatian: Holmij
    German: Holmium
    Italian: Olmio
    Spanish: Holmio

    Atomic number: 67
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1879 Per Theodor Cleve (SE)

Holmium was discovered by Per Theodore Cleve (SE) in 1879. The origin of
the name comes from the Greek word 'Holmia' meaning 'Stockholm'. It is a
fairly soft, malleable, lustrous, silvery metal that reacts slowly with
oxygen and water. Holmium dissolves in acids and is able to react
violently with air or halogens. Holmium occurs in gadolinite but most
often it's produced from monazite sand. It has very few practical
applications; however, it has some unusual magnetic properties that
offer some hope for future applications.

    Electronic configuration: [Xe] 4f11 6s2
    Formal oxidation number: +3
    Atomic radius: 174.3 pm

    Electronegativities: 1.23
    Thermal conductivity: 16.2 W/(m K)
    Electrical resistivity (20 oC): 87 microOhm cm

    Melting point: 1474 oC
    Boiling point: 2700 oC

    Heat of fusion: 17.2 kJ/mol
    Heat of vaporization: 303 kJ/mol
    Heat of atomization: 302.63 kJ/mol
EOF
fi
if [[ $ELEMENT = "hs" ]]; then
cat <<EOF

      Hs

    Relative atomic mass: [277]

    English: Hassium
    French: Hassium
    Croatian: Hassij
    German: Hassium
    Italian: Hassio
    Spanish: Hassio

    Atomic number: 108
    Group numbers: 8
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1984 Peter Armbruster, Gottfried Munzenber & GSI Darmstadt (DE)

Hassium was discovered by Peter Armbruster, Gottfried Munzenber (DE) and
their co-workers at the Heavy Ion Research Laboratory (Gesellschaft fur
Schwerionenforschung, GSI) in Darmstadt, Germany in 1984. The origin of
the name is the Latin word 'Hassias' meaning 'Hess', the German state.
It is a synthetic radioactive metal. Hassium was produced by bombarding
lead-208 with iron-58.

    Electronic configuration: [Rn] 5f14 6d6 7s2
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "i" ]]; then
cat <<EOF

      I

    Relative atomic mass: 126.90447 +- 0.00003

    English: Iodine
    French: Iode
    Croatian: Jod
    German: Iod
    Italian: Iodio
    Spanish: Yodo

    Atomic number: 53
    Group numbers: 17
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1811 Bernard Courtois (FR)

Iodine was discovered by Bernard Courtois (FR) in 1811. The origin of
the name comes from the Greek word 'iodes' meaning 'violet'. It is a
shiny, black, non-metallic solid with characteristic odour. It sublimes
easily and as a gas it is violet and intensely irritating to the eyes,
nose and throat. Iodine occurs on land and in the sea in sodium and
potassium compounds. It is required in small amounts by humans. Iodine
was once used as an antiseptic, but no longer due to its poisonous
nature.

    Electronic configuration: [Kr] 4d10 5s2 5p5
    Formal oxidation number: -1 +1 +5 +7
    Atomic radius: 133.1 pm

    Electronegativities: 2.66
    Thermal conductivity: 0.449 W/(m K)
    Electrical resistivity (20 oC): 1.3E+15 microOhm cm

    Melting point: 113.7 oC
    Boiling point: 184.4 oC

    Heat of fusion: 15.27 kJ/mol
    Heat of vaporization: 41.67 kJ/mol
    Heat of atomization: 107.24 kJ/mol
EOF
fi
if [[ $ELEMENT = "in" ]]; then
cat <<EOF

      In

    Relative atomic mass: 114.818 +- 0.003

    English: Indium
    French: Indium
    Croatian: Indij
    German: Indium
    Italian: Indio
    Spanish: Indio

    Atomic number: 49
    Group numbers: 13
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1863 Ferdinand Reich, Hieronymus Theodor Richter (DE)

Indium was discovered by Ferdinand Reich and Hieronymus Theodor Richter
(DE) in 1863. Named after the 'indicum' (colour indigo), the colour it
shows in a spectroscope. It is a rare, very soft, silver-white metal
that is stable in air and water but dissolves in acids. Metal can ignite
and burn. Indium is found in certain zinc ores. It is used to coat high
speed bearings and as an alloy that lowers the melting point of other
metals. Relatively small amounts are used in dental items and in
electronic semiconductors.

    Electronic configuration: [Kr] 4d10 5s2 5p1
    Formal oxidation number: +3
    Atomic radius: 162.6 pm

    Electronegativities: 1.78
    Thermal conductivity: 81.6 W/(m K)
    Electrical resistivity (20 oC): 8.37 microOhm cm

    Melting point: 156.6 oC
    Boiling point: 2072 oC

    Heat of fusion: 3.27 kJ/mol
    Heat of vaporization: 231.8 kJ/mol
    Heat of atomization: 243.72 kJ/mol
EOF
fi
if [[ $ELEMENT = "ir" ]]; then
cat <<EOF

      Ir

    Relative atomic mass: 192.217 +- 0.003

    English: Iridium
    French: Iridium
    Croatian: Iridij
    German: Iridium
    Italian: Iridio
    Spanish: Iridio

    Atomic number: 77
    Group numbers: 9
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1803 Smithson Tennant (GB)

Iridium was discovered by Smithson Tennant (GB) in 1803. The origin of
the name comes from the Latin word 'iris', meaning 'rainbow', because
its salts are highly coloured. It is a heavy, brittle, white metal that
is unreactive in air, water and acids but reacts with fused NaOH. Metal
ignites and burns readily. Iridium is found in gravel deposits with
platinum. It is used with osmium to tip gold pen points, to make
crucible and special containers, also to make alloys used for standard
weights and measures and heat-resistant alloys. It is used as a
hardening agent for platinum.

    Electronic configuration: [Xe] 4f14 5d7 6s2
    Formal oxidation number: +3 +4
    Atomic radius: 135.7 pm

    Electronegativities: 2.2
    Thermal conductivity: 147 W/(m K)
    Electrical resistivity (20 oC): 5.3 microOhm cm

    Melting point: 2446 oC
    Boiling point: 4428 oC

    Heat of fusion: 26.4 kJ/mol
    Heat of vaporization: 612.1 kJ/mol
    Heat of atomization: 664.34 kJ/mol
EOF
fi
if [[ $ELEMENT = "k" ]]; then
cat <<EOF

      K

    Relative atomic mass: 39.0983 +- 0.0001

    English: Potassium
    French: Potassium
    Croatian: Kalij
    German: Kalium
    Italian: Potassio
    Spanish: Potasio

    Atomic number: 19
    Group numbers: 1
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1807 Sir Humphry Davy (GB)

Potassium was discovered by Sir Humphry Davy (GB) in 1807. The origin of
the name comes from the Arabic word 'qali' meaning 'alkali' (the origin
of the symbol K comes from the Latin word 'kalium'). It is a soft, waxy,
silver-white metal. Fresh surfaces have a silvery sheen. Potassium
quickly forms dull oxide coating on exposure to air. It reacts strongly
with water and gives off a flammable gas. It also reacts violently with
oxidants. Potasium occurs only in compounds. Potassium is found in
minerals like carnallite [(KMgCl3).6H2O] and sylvite (KCl). Pure metal
is produced by the reaction of hot potassium chloride and sodium vapours
in a special retort. Pottasium is used as potash in making glass and
soap and as saltpetre, potassium nitrate (KNO3) to make explosives and
to colour fireworks in mauve. Potassium ions are vital to function of
nerve and muscle tissues.

    Electronic configuration: [Ar] 4s1
    Formal oxidation number: +1
    Atomic radius: 227.2 pm

    Electronegativities: 0.82
    Thermal conductivity: 102 W/(m K)
    Electrical resistivity (20 oC): 6.15 microOhm cm

    Melting point: 63.28 oC
    Boiling point: 759 oC

    Heat of fusion: 2.4 kJ/mol
    Heat of vaporization: 79.1 kJ/mol
    Heat of atomization: 90.14 kJ/mol
EOF
fi
if [[ $ELEMENT = "kr" ]]; then
cat <<EOF

      Kr

    Relative atomic mass: 83.798 +- 0.002

    English: Krypton
    French: Krypton
    Croatian: Kripton
    German: Krypton
    Italian: Cripto
    Spanish: Kripton

    Atomic number: 36
    Group numbers: 18
    Period: 4
    Standard state (20 oC): gas

    Discovery: 1898 Sir William Ramsay, Morris William Travers (GB)

Krypton was discovered by Sir William Ramsay and Morris William Travers
(GB) in 1898. The origin of the name comes from the Greek word 'kryptos'
meaning 'hidden'. It is a colourless, odourless rare noble gas that
reacts only with fluorine. Krypton is obtained from production of liquid
air. Krypton is used in lighting products. It is used as inert
filler-gas in incandescent bulbs and some is mixed with argon in
fluorescent lamps. The most important use is in flashing stroboscopic
lamps that outline airport runways.

    Electronic configuration: [Ar] 3d10 4s2 4p6
    Formal oxidation number: 0
    Atomic radius: 202 pm

    Electronegativities: -
    Thermal conductivity: 0.0095 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -157.36 oC
    Boiling point: -153.22 oC

    Heat of fusion: 1.64 kJ/mol
    Heat of vaporization: 9.05 kJ/mol
    Heat of atomization: 0 kJ/mol
EOF
fi
if [[ $ELEMENT = "la" ]]; then
cat <<EOF

      La

    Relative atomic mass: 138.90547 +- 0.00007

    English: Lanthanum
    French: Lanthane
    Croatian: Lantan
    German: Lanthan
    Italian: Lantanio
    Spanish: Lantano

    Atomic number: 57
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1839 Carl Gustaf Mosander (SE)

Lanthanum was discovered by Carl Gustaf Mosander (SE) in 1839. The
origin of the name comes from the Greek word 'lanthanein' meaning 'to
lie hidden'. It is a soft, silvery-white, malleable, ductile metal that
tarnishes readily in air and reacts with oxidants. Reaction with water
releases hydrogen gas, metal ignites and burns readily. Lanthanum is
found with rare earths in monazite and bastnasite. Monazite sand typical
contains 25% lanthanum. It is used in the electrodes of high-intensity,
carbon-arc lights. Because it gives glass refractive properties, it is
used in expensive camera lenses.

    Electronic configuration: [Xe] 5d1 6s2
    Formal oxidation number: +3
    Atomic radius: 187 pm

    Electronegativities: 1.1
    Thermal conductivity: 13.5 W/(m K)
    Electrical resistivity (20 oC): 57 microOhm cm

    Melting point: 918 oC
    Boiling point: 3464 oC

    Heat of fusion: 10.04 kJ/mol
    Heat of vaporization: 402.1 kJ/mol
    Heat of atomization: 431.29 kJ/mol
EOF
fi
if [[ $ELEMENT = "li" ]]; then
cat <<EOF

      Li

    Relative atomic mass: 6.941 +- 0.002

    English: Lithium
    French: Lithium
    Croatian: Litij
    German: Lithium
    Italian: Litio
    Spanish: Litio

    Atomic number: 3
    Group numbers: 1
    Period: 2
    Standard state (20 oC): solid

    Discovery: 1817 Johan August Arfvedsonn (SE)

Lithium was discovered by Johan August Arfvedson (SE) in 1817. The
origin of the name comes from the Greek word 'lithos' meaning 'stone',
apparently because it was discovered from a mineral source whereas the
other two elements, sodium and potassium, were discovered from plant
sources. It is a soft silvery-white metal and it's the lightest of
metals. Lithium reacts slowly with water and oxygen. It's flammable and
able to ignite in air. It reacts with water to give off a flammable gas.
Lithium is obtained by passing electric charge through melted lithium
chloride and from the silicate mineral called spodumene [LiAl(Si2O6)].
Lithium is used in batteries, for certain kinds of glass and ceramics
and in lubricants.

    Electronic configuration: [He] 2s1
    Formal oxidation number: +1
    Atomic radius: 152 pm

    Electronegativities: 0.98
    Thermal conductivity: 84.7 W/(m K)
    Electrical resistivity (20 oC): 8.55 microOhm cm

    Melting point: 180.5 oC
    Boiling point: 1342 oC

    Heat of fusion: 4.6 kJ/mol
    Heat of vaporization: 147.7 kJ/mol
    Heat of atomization: 157.8 kJ/mol
EOF
fi
if [[ $ELEMENT = "lr" ]]; then
cat <<EOF

      Lr

    Relative atomic mass: [262]

    English: Lawrencium
    French: Lawrencium
    Croatian: Lawrencij
    German: Lawrencium
    Italian: Lawrentio
    Spanish: Lawrencio

    Atomic number: 103
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1961 Albert Ghiorso, Torbjorn Sikkeland, Almon E. Larsh, R.M. Latimer (US)

Lawrencium was discovered by Albert Ghiorso, Torbjorn Sikkeland, Almon
E. Larsh, and Robert M. Latimer (US) in 1961. Named in honour of Ernest
O. 'Lawrence', inventor of the cyclotron. It is a synthetic radioactive
metal. Lawrencium was produced by bombarding a mixture of three isotopes
of californium with boron-10 and boron-11 ions. Eight isotopes of
lawrencium have been synthesized to date, with the longest-lived being
lawrencium-256, which has a half-life of about 30 seconds.

    Electronic configuration: [Rn] 5f14 6d1 7s2
    Formal oxidation number: +3
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 308 kJ/mol
EOF
fi
if [[ $ELEMENT = "lu" ]]; then
cat <<EOF

      Lu

    Relative atomic mass: 174.967 +- 0.001

    English: Lutetium
    French: Lutetium
    Croatian: Lutecij
    German: Lutetium
    Italian: Lutezio
    Spanish: Lutecio

    Atomic number: 71
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1907 Georges Urbain (FR); Carl Freiherr Auer von Welsbach (AT)

Lutetium was discovered by Georges Urbain (FR) and independently by Carl
Freiherr Auer von Welsbach (AT) in 1907. The origin of the name comes
from the Greek word 'Lutetia' meaning 'Paris'. It is a silvery-white and
relatively stable in air, rare earth metal. Lutetium is found with
ytterbium in gadolinite and xenotime. Stable lutetium nuclides can be
used as catalysts in cracking, alkylation, hydrogenation, and
polymerization.

    Electronic configuration: [Xe] 4f14 5d1 6s2
    Formal oxidation number: +3
    Atomic radius: 171.8 pm

    Electronegativities: 1
    Thermal conductivity: 16.4 W/(m K)
    Electrical resistivity (20 oC): 79 microOhm cm

    Melting point: 1663 oC
    Boiling point: 3402 oC

    Heat of fusion: 19.2 kJ/mol
    Heat of vaporization: 428 kJ/mol
    Heat of atomization: 427.37 kJ/mol
EOF
fi
if [[ $ELEMENT = "lv" ]]; then
cat <<EOF

      Lv

    Relative atomic mass: [291]

    English: Livermorium
    French: Livermorium
    Croatian: Livermorij
    German: Livermorium
    Italian: Livermorio
    Spanish: Livermorio

    Atomic number: 116
    Group numbers: 16
    Period: 7
    Standard state (20 oC): solid

    Discovery: 2004 Yuri Oganessian & JINR Dubna (RU), Kenton Moody & LLNL Livermore

Both Flerovium and Livermorium were detected in Russian labs over ten
years ago (1998 and 2000), but the half-lives of the particles were so
short that the scientists were unable to verify their discoveries. The
discoveries were confirmed in 2004 through a collaborative effort
scientists from the Joint Institute for Nuclear Research (JINR) in
Dubna, Rusia, and the Lawrence Livermore National Laboratory (LLNL) in
Livermore, California, USA, led by Rusian physicist Yuri Tsolakovich
Oganessian (1933-) and American chemist Kenton J. (Ken) Moody. The
Dubna-Livermore collaboration be credited with the discovery of the new
element with Z = 116. Livermorium, previously known as ununhexium,
received its name from the Lawrence Livermore National Laboratory. It is
a synthetic radioactive element that do not occour naturally in earth.
Livermorium was produced by bombarding curium-245 with calcium-48.

    Electronic configuration: [Rn] 5f14 6d10 7s2 7p4
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "md" ]]; then
cat <<EOF

      Md

    Relative atomic mass: [258]

    English: Mendelevium
    French: Mendelevium
    Croatian: Mendelevij
    German: Mendelevium
    Italian: Mendelevio
    Spanish: Mendelevio

    Atomic number: 101
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1955 Albert Ghiorso, Bernard G. Harvey, Gregory R. Choppin, Stanley G. Thompson, Glenn T. Seaborg (US)

Mendelevium was discovered by Albert Ghiorso, Bernard G. Harvey, Gregory
R. Choppin, Stanley G. Thompson, and Glenn T. Seaborg (US) in 1955.
Named in honour of Dimitri 'Mendeljejev', the Russian chemist who
devised the periodic table. It is a synthetic radioactive metal.
Mendelevium was made by bombarding einsteinium with helium ions.

    Electronic configuration: [Rn] 5f13 7s2
    Formal oxidation number: +2 +3
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 827 oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 116 kJ/mol
EOF
fi
if [[ $ELEMENT = "mg" ]]; then
cat <<EOF

      Mg

    Relative atomic mass: 24.3050 +- 0.0006

    English: Magnesium
    French: Magnesium
    Croatian: Magnezij
    German: Magnesium
    Italian: Magnesio
    Spanish: Magnesio

    Atomic number: 12
    Group numbers: 2
    Period: 3
    Standard state (20 oC): solid

    Discovery: 1808 Sir Humphry Davy (GB)

Magnesium was discovered by Sir Humphry Davy (GB) in 1808. The origin of
the name comes from the Greek word 'Magnesia', a district of Thessaly.
It is a lightweight, malleable, silvery-white metal that burns in air
with a brilliant white flame and reacts with water as temperature
elevates. It can ignite in air and it reacts violently with oxidants.
Magnesium is found in large deposits in the form of magnesite, dolomite
and other minerals. It is usually obtained by electrolysis of melted
magnesium chloride (MgCl2) derived from brines, wells and sea water.
Magnesium is used in alloys to make airplanes, missiles and other uses
for light metals. It has structural properties similar to aluminium.

    Electronic configuration: [Ne] 3s2
    Formal oxidation number: +2
    Atomic radius: 159.9 pm

    Electronegativities: 1.31
    Thermal conductivity: 156 W/(m K)
    Electrical resistivity (20 oC): 4.45 microOhm cm

    Melting point: 650 oC
    Boiling point: 1090 oC

    Heat of fusion: 9.04 kJ/mol
    Heat of vaporization: 127.6 kJ/mol
    Heat of atomization: 146.499 kJ/mol
EOF
fi
if [[ $ELEMENT = "mn" ]]; then
cat <<EOF

      Mn

    Relative atomic mass: 54.938045 +- 0.000005

    English: Manganese
    French: Manganese
    Croatian: Mangan
    German: Mangan
    Italian: Manganese
    Spanish: Manganeso

    Atomic number: 25
    Group numbers: 7
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1774 Johan Gottlieb Gahn (SE)

Manganese was discovered by Johan Gottlieb Gahn (SE) in 1774. The origin
of the name comes from the Latin word 'magnes' meaning 'magnet', or
'magnesia nigri' meaning 'black magnesia' (MnO2). It is a hard, brittle,
grey-white metal with a pinkish tinge. Impure forms are reactive and
rust like iron in moist air. Manganese is most abundant ores are
pyrolusite (MnO2), psilomelane [(Ba,H2O)2Mn5O10] and rhodochrosite
(MnCO3). Pure metal is produced by mixing MnO2 with powered Al and
ignited in a furnace. It's used in steel, batteries and ceramics. The
steel in railroad tracks can contain as much as 1.2% manganese. It is
crucial to the effectiveness of vitamin B1.

    Electronic configuration: [Ar] 3d5 4s2
    Formal oxidation number: +2 +3 +4 +7
    Atomic radius: 136.7 pm

    Electronegativities: 1.55
    Thermal conductivity: 7.82 W/(m K)
    Electrical resistivity (20 oC): 144 microOhm cm

    Melting point: 1246 oC
    Boiling point: 2061 oC

    Heat of fusion: 14.4 kJ/mol
    Heat of vaporization: 220.5 kJ/mol
    Heat of atomization: 279.37 kJ/mol
EOF
fi
if [[ $ELEMENT = "mo" ]]; then
cat <<EOF

      Mo

    Relative atomic mass: 95.94 +- 0.02

    English: Molybdenum
    French: Molybdene
    Croatian: Molibden
    German: Molybdan
    Italian: Molibdeno
    Spanish: Molibdeno

    Atomic number: 42
    Group numbers: 6
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1778 Carl Wilhelm Scheele (SE)

Molybdenum was discovered by Carl William Scheele (SE) in 1778. The
origin of the name comes from the Greek word 'molybdos' meaning 'lead'.
It is a silvery white, very hard metal, but is softer and more ductile
than tungsten. Molybdenum is found in the minerals molybdenite (MoS2)
and wulfenite (MoO4Pb). Its alloys are used in aircraft, missiles and
protective coatings in boiler plate.

    Electronic configuration: [Kr] 4d5 5s1
    Formal oxidation number: +6
    Atomic radius: 136.3 pm

    Electronegativities: 2.16
    Thermal conductivity: 138 W/(m K)
    Electrical resistivity (20 oC): 5.34 microOhm cm

    Melting point: 2623 oC
    Boiling point: 4639 oC

    Heat of fusion: 27.6 kJ/mol
    Heat of vaporization: 589.9 kJ/mol
    Heat of atomization: 656.55 kJ/mol
EOF
fi
if [[ $ELEMENT = "mt" ]]; then
cat <<EOF

      Mt

    Relative atomic mass: [276]

    English: Meitnerium
    French: Meitnerium
    Croatian: Meitnerij
    German: Meitnerium
    Italian: Meitnerio
    Spanish: Meitnerio

    Atomic number: 109
    Group numbers: 9
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1982 Peter Armbruster, Gottfried Munzenber & GSI Darmstadt (DE)

Meitnerium was discovered by Peter Armbruster, Gottfried Munzenber (DE)
and their co-workers at the Heavy Ion Research Laboratory (Gesellschaft
fur Schwerionenforschung, GSI) in Darmstadt, Germany in 1982. Named in
honour of Lise 'Meitner', the Austrian physicist. It is a synthetic
radioactive metal. Meitnerium was produced by bombarding bismuth-209
with iron-58.

    Electronic configuration: [Rn] 5f14 6d7 7s2
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "na" ]]; then
cat <<EOF

      Na

    Relative atomic mass: 22.98976928 +- 0.00000002

    English: Sodium
    French: Sodium
    Croatian: Natrij
    German: Natrium
    Italian: Sodio
    Spanish: Sodio

    Atomic number: 11
    Group numbers: 1
    Period: 3
    Standard state (20 oC): solid

    Discovery: 1807 Sir Humphry Davy (GB)

Sodium was discovered by Sir Humphry Davy (GB) in 1807. The origin of
the name comes from the Latin word 'natrium' meaning 'sodium carbonate'.
It is a soft silvery-white metal. Fresh surfaces oxidize rapidly. It
reacts vigorously, even violently with water giving off flammable gas.
Sodium burns in air with a brilliant white flame. Sodium is obtained by
electrolysis of melted sodium chloride (salt), borax and cryolite.
Metallic sodium is vital in the manufacture of organic compounds. Sodium
chloride (NaCl) is table salt. Liquid sodium is used to cool nuclear
reactors.

    Electronic configuration: [Ne] 3s1
    Formal oxidation number: +1
    Atomic radius: 185.8 pm

    Electronegativities: 0.93
    Thermal conductivity: 141 W/(m K)
    Electrical resistivity (20 oC): 4.2 microOhm cm

    Melting point: 97.72 oC
    Boiling point: 883 oC

    Heat of fusion: 2.64 kJ/mol
    Heat of vaporization: 99.2 kJ/mol
    Heat of atomization: 107.566 kJ/mol
EOF
fi
if [[ $ELEMENT = "nb" ]]; then
cat <<EOF

      Nb

    Relative atomic mass: 92.90638 +- 0.00002

    English: Niobium
    French: Niobium
    Croatian: Niobij
    German: Niob
    Italian: Niobio
    Spanish: Niobio

    Atomic number: 41
    Group numbers: 5
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1801 Charles Hatchett (GB)

Niobium was discovered by Charles Hatchett (GB) in 1801. The origin of
the name comes from the Greek word 'Niobe' meaning 'daughter of
Tantalus' in Greek mythology (tantalum is closely related to niobium in
the periodic table). It is a shiny white, soft, ductile metal. Exposed
surfaces form oxide film. Niobium occurs in a mineral columbite. It is
used in stainless steel alloys for nuclear reactors, jets and missiles.
It is used as an alloy with iron and nickel. It can be used in nuclear
reactors and is known to be superconductive when alloyed with tin,
aluminium or zirconium.

    Electronic configuration: [Kr] 4d4 5s1
    Formal oxidation number: +3 +5
    Atomic radius: 142.9 pm

    Electronegativities: 1.6
    Thermal conductivity: 53.7 W/(m K)
    Electrical resistivity (20 oC): 12.5 microOhm cm

    Melting point: 2477 oC
    Boiling point: 4744 oC

    Heat of fusion: 27.2 kJ/mol
    Heat of vaporization: 680.19 kJ/mol
    Heat of atomization: 722.819 kJ/mol
EOF
fi
if [[ $ELEMENT = "nd" ]]; then
cat <<EOF

      Nd

    Relative atomic mass: 144.242 +- 0.003

    English: Neodymium
    French: Neodyme
    Croatian: Neodimij
    German: Neodym
    Italian: Neodimio
    Spanish: Neodimio

    Atomic number: 60
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1885 Carl Freiherr Auer von Welsbach (AT)

Neodymium was discovered by Carl Freiherr Auer von Welsbach (AT) in
1885. The origin of the name comes from the Greek words 'neos didymos'
meaning 'new twin'. It is a silvery-white, rare-earth metal that
oxidizes easily in air and reacts slowly in cold water, but more rapidly
as heated. Metal ignites and burns readily. Neodymium is made from
electrolysis of its halide salts, which are made from monazite sand. It
is used in making artificial ruby for lasers, in ceramics and for a
special lens with praseodymium, also to produce bright purple glass and
special glass that filters infrared radiation. Misch metal, used in the
manufacture of pyrophoric alloys for cigarette lighters, contains about
18% neodymium metal. (Typically composition of misch metal are
Ce:Nd:Pr:La:Other rare earth=50:18:6:22:4). Neodymium is used to create
some of the most powerful permanent magnets on Earth, known as NIB
magnets they consist of neodymium, iron, and boron.

    Electronic configuration: [Xe] 4f4 6s2
    Formal oxidation number: +3
    Atomic radius: 181.4 pm

    Electronegativities: 1.14
    Thermal conductivity: 16.5 W/(m K)
    Electrical resistivity (20 oC): 64 microOhm cm

    Melting point: 1021 oC
    Boiling point: 3074 oC

    Heat of fusion: 7.113 kJ/mol
    Heat of vaporization: 328 kJ/mol
    Heat of atomization: 328.57 kJ/mol
EOF
fi
if [[ $ELEMENT = "ne" ]]; then
cat <<EOF

      Ne

    Relative atomic mass: 20.1797 +- 0.0006

    English: Neon
    French: Neon
    Croatian: Neon
    German: Neon
    Italian: Neo
    Spanish: Neon

    Atomic number: 10
    Group numbers: 18
    Period: 2
    Standard state (20 oC): gas

    Discovery: 1898 Sir William Ramsay, Morris William Travers (GB)

Neon was discovered by Sir William Ramsay and Morris William Travers
(GB) in 1898. The origin of the name comes from the Greek word 'neon'
meaning 'new'. It is a colourless, odourless inert gas. It doesn't
react, not even with fluorine. Neon is the fourth most abundant element
in the universe. Neon is obtained by liquefaction of air and separated
from the other gases by fractional distillation. The largest use for
neon gas is in advertising signs.

    Electronic configuration: [He] 2s2 2p6
    Formal oxidation number: 0
    Atomic radius: 154 pm

    Electronegativities: -
    Thermal conductivity: 0.0491 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -248.59 oC
    Boiling point: -246.08 oC

    Heat of fusion: 0.324 kJ/mol
    Heat of vaporization: 1.736 kJ/mol
    Heat of atomization: 0 kJ/mol
EOF
fi
if [[ $ELEMENT = "ni" ]]; then
cat <<EOF

      Ni

    Relative atomic mass: 58.6934 +- 0.0002

    English: Nickel
    French: Nickel
    Croatian: Nikal
    German: Nickel
    Italian: Nichel
    Spanish: Niquel

    Atomic number: 28
    Group numbers: 10
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1751 Axel Fredrik Cronstedt (SE)

Nickel was discovered by Axel Fredrik Cronstedt (SE) in 1751. The origin
of the name comes from the German word 'kupfernickel' meaning Devil's
copper or St Nicholas's (Old Nick's) copper. It is a hard, malleable,
silvery-white metal. Nickel is soluble in acids, resist alkalis. It can
be polished to a lustrous finish. It resists corrosion in air under
normal conditions. Nickel is chiefly found in pentlandite [(Ni,Fe)9S8]
ore. The metal is produced by heating the ore in a blast furnace which
replaces the sulfur with oxygen. The oxides are then treated with an
acid that reacts with the iron not the nickel. Nickel is used in
electroplating and metal alloys because of its resistance to corrosion,
in nickel-cadmium batteries, and as a catalyst and for coins.

    Electronic configuration: [Ar] 3d8 4s2
    Formal oxidation number: +2 +3
    Atomic radius: 124.6 pm

    Electronegativities: 1.91
    Thermal conductivity: 90.7 W/(m K)
    Electrical resistivity (20 oC): 6.84 microOhm cm

    Melting point: 1455 oC
    Boiling point: 2913 oC

    Heat of fusion: 17.6 kJ/mol
    Heat of vaporization: 374.8 kJ/mol
    Heat of atomization: 427.659 kJ/mol
EOF
fi
if [[ $ELEMENT = "n" ]]; then
cat <<EOF

      N

    Relative atomic mass: 14.0067 +- 0.0002

    English: Nitrogen
    French: Azote
    Croatian: Dusik
    German: Stickstoff
    Italian: Azoto
    Spanish: Nitrogeno

    Atomic number: 7
    Group numbers: 15
    Period: 2
    Standard state (20 oC): gas

    Discovery: 1772 Daniel Rutherford (GB)

Nitrogen was discovered by Daniel Rutherford (GB) in 1772. The origin of
the name comes from the Greek words 'nitron genes' meaning 'nitre' and
'forming' and the Latin word 'nitrum' (nitre is a common name for
potassium nitrate, KNO3). It is a colourless, odourless, generally inert
gas, minimally reactive at room temperature. Nitrogen is a component of
many organic and inorganic compounds and makes up about 78% of earth's
atmosphere. Nitrogen is obtained from liquid air by fractional
distillation. Nitrogen is primarily used to produce ammonia and other
fertilizers and for making nitric acid, which is used in explosives. It
is also used in welding and enhanced oil recovery.

    Electronic configuration: [He] 2s2 2p3
    Formal oxidation number: -3 -2 -1 +1 +2 +3 +4 +5
    Atomic radius: 54.9 pm

    Electronegativities: 3.04
    Thermal conductivity: 0.0258 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -210.00 oC
    Boiling point: -195.8 oC

    Heat of fusion: 0.72 kJ/mol
    Heat of vaporization: 5.577 kJ/mol
    Heat of atomization: 470.842 kJ/mol
EOF
fi
if [[ $ELEMENT = "no" ]]; then
cat <<EOF

      No

    Relative atomic mass: [259]

    English: Nobelium
    French: Nobelium
    Croatian: Nobelij
    German: Nobelium
    Italian: Nobelio
    Spanish: Nobelio

    Atomic number: 102
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1958 Albert Ghiorso, T. Sikkeland, J.R. Walton, Glenn T. Seaborg (US)

Nobelium was discovered by Nobel Institute of Physics in Stockholm and
later by Albert Ghiorso, Torbjorn Sikkeland, J. R. Walton, and Glenn T.
Seaborg (US) in 1958. Named in honour of Alfred 'Nobel', Swedish chemist
who discovered dynamite and founder of the Nobel Prizes. It is a
synthetic radioactive metal. Nobelium was made by bombarding curium with
carbon-13

    Electronic configuration: [Rn] 5f14 7s2
    Formal oxidation number: +2 +3
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 108 kJ/mol
EOF
fi
if [[ $ELEMENT = "np" ]]; then
cat <<EOF

      Np

    Relative atomic mass: [237]

    English: Neptunium
    French: Neptunium
    Croatian: Neptunij
    German: Neptunium
    Italian: Nettunio
    Spanish: Neptunio

    Atomic number: 93
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1940 Edwin Mattison McMillan, Philip Hauge Abelson (US)

Neptunium was discovered by Edwin Mattison McMillan and Philip Hauge
Abelson (US) in 1940. Named after the planet 'Neptune'. It is a rare,
silvery radioactive, radiotoxic metal that resists alkalis, reacts with
oxygen, acid and steam. Neptunium was produced by bombarding uranium
with slow neutrons.

    Electronic configuration: [Rn] 5f4 6d1 7s2
    Formal oxidation number: +3 +4 +5 +6
    Atomic radius: 130 pm

    Electronegativities: 1.3
    Thermal conductivity: 6.3 W/(m K)
    Electrical resistivity (20 oC): 122 microOhm cm

    Melting point: 644 oC
    Boiling point: 3902 oC

    Heat of fusion: 9.46 kJ/mol
    Heat of vaporization: 336.6 kJ/mol
    Heat of atomization: 457 kJ/mol
EOF
fi
if [[ $ELEMENT = "o" ]]; then
cat <<EOF

      O

    Relative atomic mass: 15.9994 +- 0.0003

    English: Oxygen
    French: Oxygene
    Croatian: Kisik
    German: Sauerstoff
    Italian: Ossigeno
    Spanish: Oxigeno

    Atomic number: 8
    Group numbers: 16
    Period: 2
    Standard state (20 oC): gas

    Discovery: 1772 Carl William Scheele (SE)

Oxygen was discovered by Carl William Scheele (SE) in 1772. The origin
of the name comes from the Greek words 'oxy genes' meaning 'acid' and
'forming' (acid former). It is a colourless, odourless gas; pale blue
liquid. Oxygen is extremely reactive and forms oxides with nearly all
other elements except noble gases. It is the most abundant element in
the earth's crust and makes up almost 21% of the atmosphere. Oxygen is
obtained primarily from liquid air by fractional distillation. Small
amounts are made in the laboratory by electrolysis of water. Oxygen is
used in steel making, welding and supporting life. Naturally occurring
ozone (O3) in the upper atmosphere shields the earth from ultraviolet
radiation.

    Electronic configuration: [He] 2s2 2p4
    Formal oxidation number: -2
    Atomic radius: 60.4 pm

    Electronegativities: 3.44
    Thermal conductivity: 0.0263 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -218.7916 oC
    Boiling point: -182.95 oC

    Heat of fusion: 0.444 kJ/mol
    Heat of vaporization: 6.82 kJ/mol
    Heat of atomization: 246.785 kJ/mol
EOF
fi
if [[ $ELEMENT = "os" ]]; then
cat <<EOF

      Os

    Relative atomic mass: 190.23 +- 0.03

    English: Osmium
    French: Osmium
    Croatian: Osmij
    German: Osmium
    Italian: Osmio
    Spanish: Osmio

    Atomic number: 76
    Group numbers: 8
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1803 Smithson Tennant (GB)

Osmium was discovered by Smithson Tennant (GB) in 1803. The origin of
the name comes from the Greek word 'osme' meaning 'smell'. It is a hard
fine black powder or hard, lustrous, blue-white metal. Osmium is
unaffected by air, water and acids. It has a characteristic acrid,
chlorine like odour due to tetroxide compound. Osmium tetroxide is
highly toxic. Osmium is obtained from the same ores as platinum. It is
used to tip gold pen points, instrument pivots, to make electric light
filaments, and also used for high temperature alloys and pressure
bearings. Osmium is very hard and resists corrosion better than any
other element.

    Electronic configuration: [Xe] 4f14 5d6 6s2
    Formal oxidation number: +3 +4
    Atomic radius: 133.8 pm

    Electronegativities: 2.2
    Thermal conductivity: 87.6 W/(m K)
    Electrical resistivity (20 oC): 9.5 microOhm cm

    Melting point: 3033 oC
    Boiling point: 5012 oC

    Heat of fusion: 29.3 kJ/mol
    Heat of vaporization: 738.06 kJ/mol
    Heat of atomization: 791 kJ/mol
EOF
fi
if [[ $ELEMENT = "pa" ]]; then
cat <<EOF

      Pa

    Relative atomic mass: 231.03588 +- 0.00002

    English: Protactinium
    French: Protactinium
    Croatian: Protaktinij
    German: Protactinium
    Italian: Protoattinio
    Spanish: Protactinio

    Atomic number: 91
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1913 Kasimir Fajans, Otto H. Gohring (DE)

Protactinium was discovered by Kasimir Fajans and Otto H. Gohring (DE)
in 1913. The origin of the name comes from the Greek word 'protos'
meaning 'first'. It is a very rare, silvery-white, extremely radioactive
metal that resists alkalis, reacts with oxygen, acids and steam.
Protactinium is highly radiotoxic, extremely toxic and must be handled
with great care. Protactinium does not occur in nature. It is found
among fission products of uranium, thorium and plutonium.

    Electronic configuration: [Rn] 5f2 6d1 7s2
    Formal oxidation number: +4 +5
    Atomic radius: 156.1 pm

    Electronegativities: 1.5
    Thermal conductivity: 47 W/(m K)
    Electrical resistivity (20 oC): 19.1 microOhm cm

    Melting point: 1572 oC
    Boiling point: - oC

    Heat of fusion: 16.7 kJ/mol
    Heat of vaporization: 481 kJ/mol
    Heat of atomization: 607 kJ/mol
EOF
fi
if [[ $ELEMENT = "pb" ]]; then
cat <<EOF

      Pb

    Relative atomic mass: 207.2 +- 0.1

    English: Lead
    French: Plomb
    Croatian: Olovo
    German: Blei
    Italian: Piombo
    Spanish: Plomo

    Atomic number: 82
    Group numbers: 14
    Period: 6
    Standard state (20 oC): solid

    Discovery: - -

Lead has been known since ancient times. The origin of the name comes
from the Latin word 'plumbum' meaning 'liquid silver'. It is a very
soft, highly malleable and ductile, blue-white shiny metal that
tarnishes in moist air but is stable in oxygen and water. Lead dissolves
in nitric acid and its compounds are toxic by inhalation or ingestion.
The toxins have a cumulative effect. Lead is found most often in ores
called galena or lead sulfide (PbS). It is used in solder, shielding
against radiation and in batteries.

    Electronic configuration: [Xe] 4f14 5d10 6s2 6p2
    Formal oxidation number: +2 +4
    Atomic radius: 175 pm

    Electronegativities: 1.8
    Thermal conductivity: 35.3 W/(m K)
    Electrical resistivity (20 oC): 20.648 microOhm cm

    Melting point: 327.46 oC
    Boiling point: 1749 oC

    Heat of fusion: 5.121 kJ/mol
    Heat of vaporization: 177.8 kJ/mol
    Heat of atomization: 195.74 kJ/mol
EOF
fi
if [[ $ELEMENT = "pd" ]]; then
cat <<EOF

      Pd

    Relative atomic mass: 106.42 +- 0.01

    English: Palladium
    French: Palladium
    Croatian: Paladij
    German: Palladium
    Italian: Palladio
    Spanish: Paladio

    Atomic number: 46
    Group numbers: 10
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1803 William Hyde Wollaston (GB)

Palladium was discovered by William Hyde Wollaston (GB) in 1803. Named
after the asteroid 'Pallas' which was discovered at about the same time
and from the Greek name 'Pallas', goddess of wisdom. It is a soft,
malleable, ductile, silvery-white metal that resists corrosion,
dissolves in oxidizing acids and absorbs hydrogen. Metal dust is
combustible. Palladium is obtained with platinum, nickel, copper and
mercury ores. It is used as a substitute for silver in dental items and
jewellery. The pure metal is used as the delicate mainsprings in analog
wristwatches. It is also used in surgical instruments and as a catalyst.

    Electronic configuration: [Kr] 4d10
    Formal oxidation number: +2 +3
    Atomic radius: 137.6 pm

    Electronegativities: 2.2
    Thermal conductivity: 71.8 W/(m K)
    Electrical resistivity (20 oC): 10.8 microOhm cm

    Melting point: 1554.9 oC
    Boiling point: 2963 oC

    Heat of fusion: 17.2 kJ/mol
    Heat of vaporization: 361.5 kJ/mol
    Heat of atomization: 377.4 kJ/mol
EOF
fi
if [[ $ELEMENT = "p" ]]; then
cat <<EOF

      P

    Relative atomic mass: 30.973762 +- 0.000002

    English: Phosphorus
    French: Phosphore
    Croatian: Fosfor
    German: Phosphor
    Italian: Fosforo
    Spanish: Fosforo

    Atomic number: 15
    Group numbers: 15
    Period: 3
    Standard state (20 oC): solid

    Discovery: 1669 Hennig Brandt (DE)

Phosphorus was discovered by Hennig Brandt (DE) in 1669. The origin of
the name comes from the Greek word 'phosphoros' meaning 'bringer of
light'. White phosphorus is white to yellow soft, waxy phosphorescent
solid with acrid fumes. It's Toxic by inhalation, ingestion, or skin
contact. Red phosphorus is powdery, non-flammable and non-toxic.
Phosphorus is most often found in phosphate rock. Pure form is obtained
by heating a mixture of phosphate rock, coke and silica to about 1450
°C. It is used in the production of fertilizers and detergents. Some is
used in fireworks, safety matches and incendiary weapons. Phosphorus is
also important in the production of steels, phosphor bronze and many
other products.

    Electronic configuration: [Ne] 3s2 3p3
    Formal oxidation number: -3 +3 +5
    Atomic radius: 110.5 pm

    Electronegativities: 2.19
    Thermal conductivity: 0.235 W/(m K)
    Electrical resistivity (20 oC): 1E+17 microOhm cm

    Melting point: 44.15 oC
    Boiling point: 280.5 oC

    Heat of fusion: 2.51 kJ/mol
    Heat of vaporization: 51.9 kJ/mol
    Heat of atomization: 314 kJ/mol
EOF
fi
if [[ $ELEMENT = "pm" ]]; then
cat <<EOF

      Pm

    Relative atomic mass: [145]

    English: Promethium
    French: Promethium
    Croatian: Prometij
    German: Promethium
    Italian: Prometio
    Spanish: Prometio

    Atomic number: 61
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1947 Jacob Akiba Marinsky, Lawrence Elgin Glendenin, Charles DuBois Coryell (US)

Promethium was discovered by Jacob Akiba Marinsky, Lawrence Elgin
Glendenin, and Charles DuBois Coryell (US) in 1947. Named after
'Prometheus' in Greek mythology, who stole fire from the gods. It is a
rare earth metal of synthetic origin on the earth, naturally made in
stars. It is Poisonous, radiotoxic and radioactive. Promethium does not
occur naturally. It is found among fission products of uranium, thorium
and plutonium. It has been used as a source of radioactivity for
thickness-measuring gages.

    Electronic configuration: [Xe] 4f5 6s2
    Formal oxidation number: +3
    Atomic radius: 183.4 pm

    Electronegativities: -
    Thermal conductivity: 17.9 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: 1042 oC
    Boiling point: 3000 oC

    Heat of fusion: 12.6 kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: 308 kJ/mol
EOF
fi
if [[ $ELEMENT = "po" ]]; then
cat <<EOF

      Po

    Relative atomic mass: [209]

    English: Polonium
    French: Polonium
    Croatian: Polonij
    German: Polonium
    Italian: Polonio
    Spanish: Polonio

    Atomic number: 84
    Group numbers: 16
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1898 Marie Sklodowska Curie, Pierre Curie (FR)

Polonium was discovered by Marie Sklodowska Curie and Pierre Curie (FR)
in 1898. Named for 'Poland', native country of Marie Curie. It is a
silvery-grey, extremely rare, highly toxic, severe radiotoxic,
carcinogen, radioactive metal that is soluble in dilute acids. Polonium
occurs in pitchblende. It's produced by bombarding bismuth with
neutrons. It is used in industrial equipment that eliminates static
electricity caused by such processes as rolling paper, wire and sheet
metal.

    Electronic configuration: [Xe] 4f14 5d10 6s2 6p4
    Formal oxidation number: +2 +4
    Atomic radius: 167.3 pm

    Electronegativities: 2
    Thermal conductivity: 20 W/(m K)
    Electrical resistivity (20 oC): 140 microOhm cm

    Melting point: 254 oC
    Boiling point: 962 oC

    Heat of fusion: 10 kJ/mol
    Heat of vaporization: 100.8 kJ/mol
    Heat of atomization: 141 kJ/mol
EOF
fi
if [[ $ELEMENT = "pr" ]]; then
cat <<EOF

      Pr

    Relative atomic mass: 140.90765 +- 0.00002

    English: Praseodymium
    French: Praseodyme
    Croatian: Praseodimij
    German: Praseodym
    Italian: Praseodimio
    Spanish: Praseodimio

    Atomic number: 59
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1885 Carl Freiherr Auer von Welsbach (AT)

Praseodymium was discovered by Carl Freiherr Auer von Welsbach (AT) in
1885. The origin of the name comes from the Greek words 'prasios
didymos' meaning 'green twin'. It is a silvery white, moderately soft,
malleable, ductile metal that reacts slowly with oxygen but reacts
rapidly with water. Metal ignites and burns readily. Praseodymium is
obtained from same salts as neodymium. It is used with neodymium to make
lenses for glass maker's goggles since it filters out the yellow light
present in glass blowing. Alloyed with magnesium praseodymium creates a
high-strength metal used in aircraft engines. Misch metal, used in the
manufacture of pyrophoric alloys for cigarette lighters, contains about
5% praseodymium metal. (Typically composition of misch metal are
Ce:Nd:Pr:La:Other rare earth=50:18:6:22:4).

    Electronic configuration: [Xe] 4f3 6s2
    Formal oxidation number: +3
    Atomic radius: 182 pm

    Electronegativities: 1.13
    Thermal conductivity: 12.5 W/(m K)
    Electrical resistivity (20 oC): 68 microOhm cm

    Melting point: 931 oC
    Boiling point: 3520 oC

    Heat of fusion: 11.3 kJ/mol
    Heat of vaporization: 357 kJ/mol
    Heat of atomization: 356.69 kJ/mol
EOF
fi
if [[ $ELEMENT = "pt" ]]; then
cat <<EOF

      Pt

    Relative atomic mass: 195.084 +- 0.009

    English: Platinum
    French: Platine
    Croatian: Platina
    German: Platin
    Italian: Platino
    Spanish: Platino

    Atomic number: 78
    Group numbers: 10
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1557 Julius Caesar Scaliger (IT)

Platinum was discovered by Julius Caesar Scaliger (IT) in 1557. The
origin of the name comes from the Spanish word 'platina' meaning
'silver'. It is a rare, very heavy, soft, silvery-white metal that
resists oxygen, water, corrosion, and acid attacks except aqua regia.
Platinum is produced from deposits of native, or elemental. It is used
in jewellery, to make crucible and special containers and as a catalyst.
Platinum is used with cobalt to produce very strong magnets, also to
make standard weights and measures.

    Electronic configuration: [Xe] 4f14 5d9 6s1
    Formal oxidation number: +2 +4
    Atomic radius: 137.3 pm

    Electronegativities: 2.2
    Thermal conductivity: 71.6 W/(m K)
    Electrical resistivity (20 oC): 10.6 microOhm cm

    Melting point: 1768.4 oC
    Boiling point: 3825 oC

    Heat of fusion: 19.7 kJ/mol
    Heat of vaporization: 469 kJ/mol
    Heat of atomization: 564.42 kJ/mol
EOF
fi
if [[ $ELEMENT = "pu" ]]; then
cat <<EOF

      Pu

    Relative atomic mass: [244]

    English: Plutonium
    French: Plutonium
    Croatian: Plutonij
    German: Plutonium
    Italian: Plutonio
    Spanish: Plutonio

    Atomic number: 94
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1940 Glenn Theodore Seaborg, Joseph W. Kennedy, Arthur C. Wahl (US)

Plutonium was discovered by Glenn Theodore Seaborg, Joseph W. Kennedy,
and Arthur C. Wahl (US) in 1940. Named after the planet 'Pluto'. It is a
silvery-white, extremely radioactive, highly toxic, artificially
produced metal that reacts with oxygen, acids and steam, but it resists
alkalis. Plutonium is found rarely in some uranium ores. It can be made
by bombarding uranium with neutrons. Plutonium is used in bombs and
reactors. Small quantities are used in thermo-electric generators.

    Electronic configuration: [Rn] 5f6 7s2
    Formal oxidation number: +3 +4 +5 +6
    Atomic radius: 151.3 pm

    Electronegativities: 1.3
    Thermal conductivity: 6.74 W/(m K)
    Electrical resistivity (20 oC): 150 microOhm cm

    Melting point: 640 oC
    Boiling point: 3228 oC

    Heat of fusion: 2.8 kJ/mol
    Heat of vaporization: 343.5 kJ/mol
    Heat of atomization: 348 kJ/mol
EOF
fi
if [[ $ELEMENT = "ra" ]]; then
cat <<EOF

      Ra

    Relative atomic mass: [226]

    English: Radium
    French: Radium
    Croatian: Radij
    German: Radium
    Italian: Radio
    Spanish: Radio

    Atomic number: 88
    Group numbers: 2
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1898 Marie Sklodowska Curie, Perre Curie (FR)

Radium was discovered by Marie Sklodowska Curie and Perre Curie (FR) in
1898. The origin of the name comes from the Latin word 'radius' meaning
'ray'. It is a silvery-white radioactive metal that reacts with oxygen
and water. It is highly radiotoxic and carcinogen by inhalation,
ingestion, or exposure. Radium is found in uranium ores at 1 part per 3
million parts uranium. Used in treating cancer because of the gamma rays
it gives off.

    Electronic configuration: [Rn] 7s2
    Formal oxidation number: +2
    Atomic radius: 235 pm

    Electronegativities: 0.9
    Thermal conductivity: 18.6 W/(m K)
    Electrical resistivity (20 oC): 100 microOhm cm

    Melting point: 700 oC
    Boiling point: 1140 oC

    Heat of fusion: 7.15 kJ/mol
    Heat of vaporization: 136.7 kJ/mol
    Heat of atomization: 159 kJ/mol
EOF
fi
if [[ $ELEMENT = "rb" ]]; then
cat <<EOF

      Rb

    Relative atomic mass: 85.4678 +- 0.0003

    English: Rubidium
    French: Rubidium
    Croatian: Rubidij
    German: Rubidium
    Italian: Rubidio
    Spanish: Rubidio

    Atomic number: 37
    Group numbers: 1
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1861 Robert Wilhelm Bunsen, Gustav Robert Kirchhoff (DE)

Rubidium was discovered by Robert Wilhelm Bunsen and Gustav Robert
Kirchhoff (DE) in 1861. The origin of the name comes from the Latin word
'rubidius' meaning 'dark red' or 'deepest red'. It is a soft,
silvery-white, highly reactive metal that ignites in air and reacts
violently with water or oxidants. Rubidium occurs abundantly, but so
widespread that production is limited. It is usually obtained from
lithium production. It is used in photocells, cathode-ray and vacuum
tubes, and as a catalyst.

    Electronic configuration: [Kr] 5s1
    Formal oxidation number: +1
    Atomic radius: 247.5 pm

    Electronegativities: 0.82
    Thermal conductivity: 52.8 W/(m K)
    Electrical resistivity (20 oC): 12.5 microOhm cm

    Melting point: 39.31 oC
    Boiling point: 688 oC

    Heat of fusion: 2.2 kJ/mol
    Heat of vaporization: 75.7 kJ/mol
    Heat of atomization: 82.17 kJ/mol
EOF
fi
if [[ $ELEMENT = "re" ]]; then
cat <<EOF

      Re

    Relative atomic mass: 186.207 +- 0.001

    English: Rhenium
    French: Rhenium
    Croatian: Renij
    German: Rhenium
    Italian: Renio
    Spanish: Renio

    Atomic number: 75
    Group numbers: 7
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1925 Walter Noddack, Ida Tacke-Noddack, Otto Berg (DE)

Rhenium was discovered by Walter Noddack, Ida Tacke-Noddack and Otto
Berg (DE) in 1925. The origin of the name comes from the Latin word
'Rhenus' meaning river 'Rhine'. It is a rare and costly, dense,
silvery-white metal that tarnishes in moist air, resists corrosion and
oxidation .Rhenium dissolves in nitric and sulfuric acids but has a very
high melting point. Rhenium is found in small amounts in gadolinite and
molybdenite. It is mixed with tungsten or platinum to make filaments for
mass spectrographs. Its main value is as a trace alloying agent for
hardening metal components that are subjected to continuous frictional
forces.

    Electronic configuration: [Xe] 4f14 5d5 6s2
    Formal oxidation number: +4 +6 +7
    Atomic radius: 137.1 pm

    Electronegativities: 1.9
    Thermal conductivity: 47.9 W/(m K)
    Electrical resistivity (20 oC): 19.3 microOhm cm

    Melting point: 3186 oC
    Boiling point: 5596 oC

    Heat of fusion: 33.1 kJ/mol
    Heat of vaporization: 704.25 kJ/mol
    Heat of atomization: 769 kJ/mol
EOF
fi
if [[ $ELEMENT = "rf" ]]; then
cat <<EOF

      Rf

    Relative atomic mass: [267]

    English: Rutherfordium
    French: Rutherfordium
    Croatian: Ruthefordij
    German: Rutherfordium
    Italian: Rutherfordio
    Spanish: Rutherfordio

    Atomic number: 104
    Group numbers: 4
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1964 Albert Ghiorso & Berkely Lab. (US), Georgy Nikolaevich Flerov & JINR Dubna (RU)

Rutherfordium was discovered by workers at the Nuclear Institute at
Dubna (RU) and by workers at the University of California, Berkeley (US)
in 1964. Name in honour of Lord 'Rutherford', the physicist and chemist
from New Zealand. It is a synthetic radioactive metal. Rutherfordium was
made by bombarding californium-249 with beams of carbon-12 and 13. Six
isotopes of rutherfordium have so far been identified.
Rutherfordium-261, the longest-lived, has a half-life of 62 seconds.

    Electronic configuration: [Rn] 5f14 6d2 7s2
    Formal oxidation number: +4
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "rg" ]]; then
cat <<EOF

      Rg

    Relative atomic mass: [280]

    English: Roentgenium
    French: Roentgenium
    Croatian: Rendgenij
    German: Roentgenium
    Italian: Roentgenio
    Spanish: Roentgenio

    Atomic number: 111
    Group numbers: 11
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1994 Sigurd Hofmann & GSI Darmstadt (DE)

Roentgenium was discovered by S. Hofmann (DE) et al. collaboration at
the Heavy Ion Research Laboratory (Gesellschaft fur
Schwerionenforschung, GSI) in Darmstadt, Germany in December 1994. Named
in honour of Wilhelm Conrad 'Roentgen'. It is a synthetic radioactive
metal. It is created in the bombardments of 209Bi targets with 64Ni
using the velocity selector SHIP facility to discriminate in favor of
the fused product, 272111 + 1n, three sets of localized alpha-decay
chains were observed with position-sensitive detectors.

    Electronic configuration: [Rn] 5f14 6d10 7s1
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "rh" ]]; then
cat <<EOF

      Rh

    Relative atomic mass: 102.90550 +- 0.00002

    English: Rhodium
    French: Rhodium
    Croatian: Rodij
    German: Rhodium
    Italian: Rodio
    Spanish: Rodio

    Atomic number: 45
    Group numbers: 9
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1803 William Hyde Wollaston (GB)

Rhodium was discovered by William Hyde Wollaston (GB) in 1804. The
origin of the name comes from the Greek word 'rhodon' meaning 'rose'. It
is a hard, silvery-white metal, inert in air and acids that reacts with
fused alkalis. Rhodium is obtained as a by-product of nickel production.
It is used as a coating to prevent wear on high quality science
equipment and with platinum to make thermocouples.

    Electronic configuration: [Kr] 4d8 5s1
    Formal oxidation number: +3
    Atomic radius: 134.5 pm

    Electronegativities: 2.28
    Thermal conductivity: 150 W/(m K)
    Electrical resistivity (20 oC): 4.51 microOhm cm

    Melting point: 1964 oC
    Boiling point: 3695 oC

    Heat of fusion: 21.55 kJ/mol
    Heat of vaporization: 494.34 kJ/mol
    Heat of atomization: 555.59 kJ/mol
EOF
fi
if [[ $ELEMENT = "rn" ]]; then
cat <<EOF

      Rn

    Relative atomic mass: [222]

    English: Radon
    French: Radon
    Croatian: Radon
    German: Radon
    Italian: Radon
    Spanish: Radon

    Atomic number: 86
    Group numbers: 18
    Period: 6
    Standard state (20 oC): gas

    Discovery: 1899 Robert Bowie Owens, Ernest Rutherford (GB)

Radon was discovered by Robert Bowie Owens and Ernest Rutherford (GB) in
1899. The origin of the name is variation of the name of element
'radium'; radon was called niton at first, from the Latin word 'nitens'
meaning 'shining'. It is a colourless, odourless radioactive, heavy,
noble gas that is chemically inert and non-flammable but is highly
radiotoxic and carcinogen by inhalation. Radon is formed from the decay
of radium in the earths crust. It is used to treat some forms of cancer.

    Electronic configuration: [Xe] 4f14 5d10 6s2 6p6
    Formal oxidation number: 0
    Atomic radius: 240 pm

    Electronegativities: -
    Thermal conductivity: 0.0036 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -71 oC
    Boiling point: -61.7 oC

    Heat of fusion: 2.7 kJ/mol
    Heat of vaporization: 18.1 kJ/mol
    Heat of atomization: 0 kJ/mol
EOF
fi
if [[ $ELEMENT = "ru" ]]; then
cat <<EOF

      Ru

    Relative atomic mass: 101.07 +- 0.02

    English: Ruthenium
    French: Ruthenium
    Croatian: Rutenij
    German: Ruthenium
    Italian: Rutenio
    Spanish: Rutenio

    Atomic number: 44
    Group numbers: 8
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1844 Karl Karlovich Klaus (RU)

Ruthenium was discovered by Karl Karlovich Klaus (RU) in 1844. The
origin of the name comes from the Latin word 'Ruthenia' meaning
'Russia'. It is a rare, extremely brittle, silver-grey metal. Ruthenium
is unaffected by air, water or acids but reacts with very hot (molten)
alkalis. Ruthenium is found in pentlandite and pyroxinite. It is used to
harden platinum and palladium, aircraft magnetos use platinum alloy with
10% ruthenium.

    Electronic configuration: [Kr] 4d7 5s1
    Formal oxidation number: +3
    Atomic radius: 132.5 pm

    Electronegativities: 2.2
    Thermal conductivity: 117 W/(m K)
    Electrical resistivity (20 oC): 7.6 microOhm cm

    Melting point: 2334 oC
    Boiling point: 4150 oC

    Heat of fusion: 23.7 kJ/mol
    Heat of vaporization: 567 kJ/mol
    Heat of atomization: 641.031 kJ/mol
EOF
fi
if [[ $ELEMENT = "sb" ]]; then
cat <<EOF

      Sb

    Relative atomic mass: 121.760 +- 0.001

    English: Antimony
    French: Antimoine
    Croatian: Antimon
    German: Antimon
    Italian: Antimonio
    Spanish: Antimonio

    Atomic number: 51
    Group numbers: 15
    Period: 5
    Standard state (20 oC): solid

    Discovery: - -

Antimony has been known since ancient times. The origin of the name
comes from the Latin word 'stibium' meaning mineral 'stibnite'. It is a
hard, brittle, silvery-white semimetal that is stable in dry air. It is
toxic by ingestion or inhalation. Antimony is found in stibnite (Sb2S3)
and in valentinite (Sb2O3). It is alloyed with other metals to increase
their hardness. It is used in the manufacture of a few special types of
semiconductor devices, also in plastics and chemicals. A few kinds of
over-the-counter cold and flu remedies use antimony compounds.

    Electronic configuration: [Kr] 4d10 5s2 5p3
    Formal oxidation number: -3 +3 +5
    Atomic radius: 145 pm

    Electronegativities: 2.05
    Thermal conductivity: 24.3 W/(m K)
    Electrical resistivity (20 oC): 39 microOhm cm

    Melting point: 630.63 oC
    Boiling point: 1587 oC

    Heat of fusion: 20.9 kJ/mol
    Heat of vaporization: 165.8 kJ/mol
    Heat of atomization: 262.04 kJ/mol
EOF
fi
if [[ $ELEMENT = "sc" ]]; then
cat <<EOF

      Sc

    Relative atomic mass: 44.955912 +- 0.000006

    English: Scandium
    French: Scandium
    Croatian: Skandij
    German: Scandium
    Italian: Scandio
    Spanish: Escandio

    Atomic number: 21
    Group numbers: 3
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1879 Lars Fredrik Nilson (SE)

Scandium was discovered by Lars Fredrik Nilson (SE) in 1879. The origin
of the name comes from the Latin word 'Scandia' meaning 'Scandinavia'.
It is a fairly soft, silvery-white metal. It burns easily and tarnishes
readily in air, and react with water to form hydrogen gas Scandium
occurs mainly in the minerals thortveitile (\~34% scandium), wiikite and
in some tin and tungsten ores. Pure scandium is obtained as a by-product
of uranium refining. Scandium metal is used in some aerospace
applications. Scandium oxide (Sc2O3) is used in the manufacture of
high-intensity electric lamps. Scandium iodide (ScI3) is used in lamps
that produce light having a colour closely matching natural sunlight.

    Electronic configuration: [Ar] 3d1 4s2
    Formal oxidation number: +3
    Atomic radius: 160.6 pm

    Electronegativities: 1.36
    Thermal conductivity: 15.8 W/(m K)
    Electrical resistivity (20 oC): 61 microOhm cm

    Melting point: 1541 oC
    Boiling point: 2836 oC

    Heat of fusion: 15.9 kJ/mol
    Heat of vaporization: 376.1 kJ/mol
    Heat of atomization: 376.02 kJ/mol
EOF
fi
if [[ $ELEMENT = "se" ]]; then
cat <<EOF

      Se

    Relative atomic mass: 78.96 +- 0.03

    English: Selenium
    French: Selenium
    Croatian: Selenij
    German: Selen
    Italian: Selenio
    Spanish: Selenio

    Atomic number: 34
    Group numbers: 16
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1817 Jons Jacob Berzelius (SE)

Selenium was discovered by Jons Jacob Berzelius (SE) in 1817. The origin
of the name comes from the Greek word 'selene' meaning 'moon'. It is a
soft metalloid similar to sulfur, unaffected by water and soluble in
alkalis and nitric acid. The colour ranges from grey metallic to red
glassy. Selenium burns in air and is toxic by inhalation or ingestion.
Also it conducts electricity when struck by light. Selenium is obtained
from lead, copper and nickel refining. Light causes it to conduct
electricity more easily. It is used in photoelectric cells, TV cameras,
xerography machines and as a semiconductor in solar batteries and
rectifiers, also colours glass red.

    Electronic configuration: [Ar] 3d10 4s2 4p4
    Formal oxidation number: -2 +4 +6
    Atomic radius: 116 pm

    Electronegativities: 2.55
    Thermal conductivity: 2.04 W/(m K)
    Electrical resistivity (20 oC): 12 microOhm cm

    Melting point: 221 oC
    Boiling point: 685 oC

    Heat of fusion: 5.1 kJ/mol
    Heat of vaporization: 90 kJ/mol
    Heat of atomization: 226.4 kJ/mol
EOF
fi
if [[ $ELEMENT = "sg" ]]; then
cat <<EOF

      Sg

    Relative atomic mass: [271]

    English: Seaborgium
    French: Seaborgium
    Croatian: Seaborgij
    German: Seaborgium
    Italian: Seaborgio
    Spanish: Seaborgio

    Atomic number: 106
    Group numbers: 6
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1974 Albert Ghiorso, Kenneth Hulet et al. (US)

Seaborgium was discovered by workers at the Nuclear Institute at Dubna
(RU) and by workers at the University of California, Berkeley (US) in
1974. Named in honour of Glenn T. 'Seaborg', American nuclear chemist
and Nobel prize winner. It is a synthetic radioactive metal. Seaborgium
was made by bombarding californium-249 with oxygen-18.

    Electronic configuration: [Rn] 5f14 6d4 7s2
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "si" ]]; then
cat <<EOF

      Si

    Relative atomic mass: 28.0855 +- 0.0003

    English: Silicon
    French: Silicium
    Croatian: Silicij
    German: Silizium
    Italian: Silicio
    Spanish: Silicio

    Atomic number: 14
    Group numbers: 14
    Period: 3
    Standard state (20 oC): solid

    Discovery: 1824 Jons Jacob Berzelius (SE)

Silicon was discovered by Jons Jacob Berzelius (SE) in 1824. The origin
of the name comes from the Latin word 'silicis' meaning 'flint'.
Amorphous form of silicon is brown powder; crystalline form has grey
metallic appearance. The solid form is unreactive with oxygen, water and
most acids. It dissolves in hot alkali. Silica dust is a moderately
toxic acute irritant. Silicon makes up major portion of clay, granite,
quartz (SiO2) and sand. Commercial production depends on a reaction
between sand (SiO2) and carbon at a temperature of around 2200 °C. It is
used in glass as silicon dioxide (SiO2). Silicon carbide (SiC) is one of
the hardest substances known and used in polishing. Silicon is by far
the more widely used semiconductor for electronics.

    Electronic configuration: [Ne] 3s2 3p2
    Formal oxidation number: -4 +2 +4
    Atomic radius: 117.6 pm

    Electronegativities: 1.9
    Thermal conductivity: 148 W/(m K)
    Electrical resistivity (20 oC): 10 microOhm cm

    Melting point: 1414 oC
    Boiling point: 3265 oC

    Heat of fusion: 39.6 kJ/mol
    Heat of vaporization: 383.3 kJ/mol
    Heat of atomization: 451.29 kJ/mol
EOF
fi
if [[ $ELEMENT = "s" ]]; then
cat <<EOF

      S

    Relative atomic mass: 32.065 +- 0.005

    English: Sulfur (Sulphur)
    French: Soufre
    Croatian: Sumpor
    German: Schwefel
    Italian: Zolfo
    Spanish: Azufre

    Atomic number: 16
    Group numbers: 16
    Period: 3
    Standard state (20 oC): solid

    Discovery: - -

Sulfur (or sulphur) has been known since ancient times. The origin of
the name comes from the Latin word 'sulfur' (or 'sulpur' or 'sulphur')
which derived from the Sanskrit word 'sulvere'. It is a pale yellow,
odourless, brittle solid, which is insoluble in water but soluble in
carbon disulfide. Sulfur is found in pure form and in ores like
cinnabar, galena, sphalerite and stibnite. Pure form is obtained from
underground deposits by the Frasch process. Sulfur is used in matches,
gunpowder, medicines, rubber and pesticides, dyes and insecticides, and
for making sulfuric acid (H2SO4).

    Electronic configuration: [Ne] 3s2 3p4
    Formal oxidation number: -2 +4 +6
    Atomic radius: 103.5 pm

    Electronegativities: 2.58
    Thermal conductivity: 0.269 W/(m K)
    Electrical resistivity (20 oC): 2E+23 microOhm cm

    Melting point: 115.21 oC
    Boiling point: 444.60 oC

    Heat of fusion: 1.7175 kJ/mol
    Heat of vaporization: 9.62 kJ/mol
    Heat of atomization: 276.6 kJ/mol
EOF
fi
if [[ $ELEMENT = "sm" ]]; then
cat <<EOF

      Sm

    Relative atomic mass: 150.36 +- 0.02

    English: Samarium
    French: Samarium
    Croatian: Samarij
    German: Samarium
    Italian: Samario
    Spanish: Samario

    Atomic number: 62
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1879 Paul-Emile Lecoq de Boisbaudran (FR)

Samarium was discovered by Paul-Emile Lecoq de Boisbaudran (FR) in 1879.
Named after the mineral 'samarskite'. It is a silvery rare earth metal
that is stable in dry air but reacts with water. Oxide coating forms on
surfaces exposed to moist air and the metal ignites and burns readily.
Samarium is found with other rare earths in monazite sand. It is used in
the electronics and ceramics industries. It is easily magnetized and
very difficult to demagnetise. This suggests important future
applications in solid-state and superconductor technologies.

    Electronic configuration: [Xe] 4f6 6s2
    Formal oxidation number: +2 +3
    Atomic radius: 180.4 pm

    Electronegativities: 1.17
    Thermal conductivity: 13.3 W/(m K)
    Electrical resistivity (20 oC): 88 microOhm cm

    Melting point: 1074 oC
    Boiling point: 1794 oC

    Heat of fusion: 10.9 kJ/mol
    Heat of vaporization: 164.8 kJ/mol
    Heat of atomization: 206.1 kJ/mol
EOF
fi
if [[ $ELEMENT = "sn" ]]; then
cat <<EOF

      Sn

    Relative atomic mass: 118.710 +- 0.007

    English: Tin
    French: Etain
    Croatian: Kositar
    German: Zinn
    Italian: Stagno
    Spanish: Estano

    Atomic number: 50
    Group numbers: 14
    Period: 5
    Standard state (20 oC): solid

    Discovery: - -

Tin has been known since ancient times. The origin of the name comes
from the Latin word 'stannum' meaning 'tin'. It is a silvery-white,
soft, malleable and ductile metal that ressist oxygen and water but
dissolves in acids and bases. Exposed surfaces form oxide film. Organic
tin compounds may be highly toxic. Tin is principally found in the ore
cassiterite (SnO2) and stannine (Cu2FeSnS4). It is used as a coating for
steel cans since it is non-toxic and non-corrosive, also in solder
(33%Sn:67%Pb), bronze (20%Sn:80%Cu) and pewter. Stannous fluoride
(SnF2), a compound of tin and fluorine is used in some toothpaste.

    Electronic configuration: [Kr] 4d10 5s2 5p2
    Formal oxidation number: +2 +4
    Atomic radius: 140.5 pm

    Electronegativities: 1.96
    Thermal conductivity: 66.6 W/(m K)
    Electrical resistivity (20 oC): 11 microOhm cm

    Melting point: 231.928 oC
    Boiling point: 2602 oC

    Heat of fusion: 7.2 kJ/mol
    Heat of vaporization: 296.2 kJ/mol
    Heat of atomization: 302 kJ/mol
EOF
fi
if [[ $ELEMENT = "sr" ]]; then
cat <<EOF

      Sr

    Relative atomic mass: 87.62 +- 0.01

    English: Strontium
    French: Strontium
    Croatian: Stroncij
    German: Strontium
    Italian: Stronzio
    Spanish: Estroncio

    Atomic number: 38
    Group numbers: 2
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1789 Adair Crawford (GB)

Strontium was discovered by Adair Crawford (GB) in 1789. Named after the
village of 'Strontian' in Scotland. It is a soft, malleable,
silvery-yellow metal that is combustible in air and reacts with water.
Exposed surfaces form protective oxide film. It ignites and burns
readily. Strontium is found in minerals celestite and strontianite.
Strontium is used in flares and fireworks for crimson colour.
Strontium-90 is a long lived highly radioactive fallout product of
atomic-bomb explosions.

    Electronic configuration: [Kr] 5s2
    Formal oxidation number: +2
    Atomic radius: 215.1 pm

    Electronegativities: 0.95
    Thermal conductivity: 49 W/(m K)
    Electrical resistivity (20 oC): 23 microOhm cm

    Melting point: 777 oC
    Boiling point: 1382 oC

    Heat of fusion: 9.16 kJ/mol
    Heat of vaporization: 154.4 kJ/mol
    Heat of atomization: 164.4 kJ/mol
EOF
fi
if [[ $ELEMENT = "ta" ]]; then
cat <<EOF
EOF
fi
if [[ $ELEMENT = "tb" ]]; then
cat <<EOF

      Tb

    Relative atomic mass: 158.92535 +- 0.00002

    English: Terbium
    French: Terbium
    Croatian: Terbij
    German: Terbium
    Italian: Terbio
    Spanish: Terbio

    Atomic number: 65
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1843 Carl Gustav Mosander (SE)

Terbium was discovered by Carl Gustaf Mosander (SE) in 1843. Named after
'Ytterby', a village in Sweden. It is a soft, ductile, silvery-grey,
rare earth metal that oxidizes slowly in air and reacts with cold water.
Terbium is found with other rare earths in monazite sand. Other sources
are xenotime and euxenite, both of which are oxide mixtures that can
contain up to 1% terbium. It is used in modest amounts in special lasers
and solid-state devices.

    Electronic configuration: [Xe] 4f9 6s2
    Formal oxidation number: +3
    Atomic radius: 176.3 pm

    Electronegativities: -
    Thermal conductivity: 11.1 W/(m K)
    Electrical resistivity (20 oC): 116 microOhm cm

    Melting point: 1356 oC
    Boiling point: 3230 oC

    Heat of fusion: 16.3 kJ/mol
    Heat of vaporization: 391 kJ/mol
    Heat of atomization: 390.62 kJ/mol
EOF
fi
if [[ $ELEMENT = "tc" ]]; then
cat <<EOF

      Tc

    Relative atomic mass: [98]

    English: Technetium
    French: Technetium
    Croatian: Tehnecij
    German: Technetium
    Italian: Tecneto
    Spanish: Tecnecio

    Atomic number: 43
    Group numbers: 7
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1937 Carlo Perrier (IT), Emilio Segre (US)

Technetium was discovered by Carlo Perrier (IT) and Emilio Segre (US) in
1937. The origin of the name comes from the Greek word 'technikos'
meaning 'artificial'. It is a silvery-grey metal that resists oxidation
but tarnishes in moist air and burns in high oxygen environment.
Technetium is the first synthetically produced element. It is also
radioactive. Technetium is made by bombarding molybdenum with deuterons
(heavy hydrogen) in a cyclotron. Added to iron in quantities as low as
55 part-per-million transforms the iron into a corrosion-resistant
alloy.

    Electronic configuration: [Kr] 4d6 5s1
    Formal oxidation number: +4 +6 +7
    Atomic radius: 135.2 pm

    Electronegativities: 2.1
    Thermal conductivity: 50.6 W/(m K)
    Electrical resistivity (20 oC): 16.9 microOhm cm

    Melting point: 2157 oC
    Boiling point: 4265 oC

    Heat of fusion: 23.81 kJ/mol
    Heat of vaporization: 585.22 kJ/mol
    Heat of atomization: 678 kJ/mol
EOF
fi
if [[ $ELEMENT = "te" ]]; then
cat <<EOF

      Te

    Relative atomic mass: 127.60 +- 0.03

    English: Tellurium
    French: Tellure
    Croatian: Telurij
    German: Tellur
    Italian: Tellurio
    Spanish: Teluro

    Atomic number: 52
    Group numbers: 16
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1782 Franz Joseph Muller von Reichstein (AT)

Tellurium was discovered by Franz Joseph Muller von Reichstein (AT) in
1782. The origin of the name comes from the Latin word 'tellus' meaning
'earth'. It is a silvery-white, brittle semi-metal that is unreactive
with water or HCl, burns in air or oxygen and dissolves in HNO3.
Tellurium is obtained as a by-product of copper and lead refining. It is
used to improve the machining quality of copper and stainless steel
products and to colour glass and ceramics. It is also used in
thermoelectric devices, in the rubber industry and it is a basic
ingredient in manufacturing blasting caps.

    Electronic configuration: [Kr] 4d10 5s2 5p4
    Formal oxidation number: -2 +4 +6
    Atomic radius: 143.2 pm

    Electronegativities: 2.1
    Thermal conductivity: 2.35 W/(m K)
    Electrical resistivity (20 oC): 436000 microOhm cm

    Melting point: 449.51 oC
    Boiling point: 988 oC

    Heat of fusion: 13.5 kJ/mol
    Heat of vaporization: 104.6 kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "th" ]]; then
cat <<EOF

      Th

    Relative atomic mass: 232.03806 +- 0.00002

    English: Thorium
    French: Thorium
    Croatian: Torij
    German: Thorium
    Italian: Torio
    Spanish: Torio

    Atomic number: 90
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1828 Jons Jacob Berzelius (SE)

Thorium was discovered by Jons Jacob Berzelius (SE) in 1828. Named after
'Thor', the mythological Scandinavian god of war. It is a heavy, grey,
soft, malleable, ductile, radioactive metal that tarnishes in air and
reacts with water. It reacts violently with oxidants. Thorium is found
in various minerals like monazite and thorite. It is used in making
strong alloys, in ultraviolet photoelectric cells. It is a common
ingredient in high-quality lenses. When bombarded with neutrons thorium
creates uranium-233, a nuclear fuel.

    Electronic configuration: [Rn] 6d2 7s2
    Formal oxidation number: +4
    Atomic radius: 179.8 pm

    Electronegativities: 1.3
    Thermal conductivity: 54 W/(m K)
    Electrical resistivity (20 oC): 13 microOhm cm

    Melting point: 1750 oC
    Boiling point: 4788 oC

    Heat of fusion: 19.2 kJ/mol
    Heat of vaporization: 513.67 kJ/mol
    Heat of atomization: 598.65 kJ/mol
EOF
fi
if [[ $ELEMENT = "ti" ]]; then
cat <<EOF

      Ti

    Relative atomic mass: 47.867 +- 0.001

    English: Titanium
    French: Titane
    Croatian: Titanij
    German: Titan
    Italian: Titanio
    Spanish: Titanio

    Atomic number: 22
    Group numbers: 4
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1791 William Gregor (GB)

Titanium was discovered by William Gregor (GB) in 1791. Named after the
'Titans', the sons of the Earth goddess in Greek mythology. It is a
shiny, dark-grey metal. In powdered form it burns in air. Exposed
surfaces form oxide coating. It can be highly polished and is relatively
immune to tarnishing. Titanium is unreactive with alkali and most acids.
Titanium usually occurs in the minerals ilmenite (FeTiO3), rutile (TiO2)
and iron ores. Pure metal produced by heating TiO2 with carbon and
chlorine to produce TiCl4 then heated with Mg gas in argon atmosphere.
Since it is strong and resists acids it is used in many alloys. Titanium
dioxide (TiO2), a white pigment that covers surfaces very well, is used
in paint, rubber, paper and many others.

    Electronic configuration: [Ar] 3d2 4s2
    Formal oxidation number: +2 +3 +4
    Atomic radius: 144.8 pm

    Electronegativities: 1.54
    Thermal conductivity: 21.9 W/(m K)
    Electrical resistivity (20 oC): 42 microOhm cm

    Melting point: 1668 oC
    Boiling point: 3287 oC

    Heat of fusion: 20.9 kJ/mol
    Heat of vaporization: 425.5 kJ/mol
    Heat of atomization: 467.14 kJ/mol
EOF
fi
if [[ $ELEMENT = "tl" ]]; then
cat <<EOF

      Tl

    Relative atomic mass: 204.3833 +- 0.0002

    English: Thallium
    French: Thallium
    Croatian: Talij
    German: Thallium
    Italian: Tallio
    Spanish: Talio

    Atomic number: 81
    Group numbers: 13
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1861 Sir William Crookes (GB)

Thallium was discovered by Sir William Crookes (GB) in 1861. The origin
of the name comes from the Greek word 'thallos' meaning 'green twig' or
'green shoot'. It is a soft grey metal that looks like lead and
tarnishes in moist air. Thallium reacts in heated moist air and in
acids. Its compounds are highly toxic by inhalation or ingestion and
have a cumulative effect. Thallium is found in iron pyrites, in
crookesite, hutchinsonite and lorandite. Most is recovered from the
by-products of lead and zinc refining. Its compounds are used in rat and
ant poisons and for detecting infrared radiation.

    Electronic configuration: [Xe] 4f14 5d10 6s2 6p1
    Formal oxidation number: +1 +3
    Atomic radius: 170 pm

    Electronegativities: 1.8
    Thermal conductivity: 46.1 W/(m K)
    Electrical resistivity (20 oC): 18 microOhm cm

    Melting point: 304 oC
    Boiling point: 1473 oC

    Heat of fusion: 4.31 kJ/mol
    Heat of vaporization: 166.1 kJ/mol
    Heat of atomization: 182.845 kJ/mol
EOF
fi
if [[ $ELEMENT = "tm" ]]; then
cat <<EOF

      Tm

    Relative atomic mass: 168.93421 +- 0.00002

    English: Thulium
    French: Thulium
    Croatian: Tulij
    German: Thulium
    Italian: Tulio
    Spanish: Tulio

    Atomic number: 69
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1879 Per Theodor Cleve (SE)

Thulium was discovered by Per Theodore Cleve (SE) in 1879. Named after
'Thule', an ancient name for Scandinavia. It is a soft, malleable,
ductile, silvery metal that tarnishes in air and reacts with water.
Thulium dust is flammable. Thulium is found with other rare earths in
the minerals gadolinite, euxenite, xenotime and monazite. Radioactive
thulium is used to power portable x-ray machines, eliminating the need
for electrical equipment.

    Electronic configuration: [Xe] 4f13 6s2
    Formal oxidation number: +3
    Atomic radius: 172.4 pm

    Electronegativities: 1.25
    Thermal conductivity: 16.8 W/(m K)
    Electrical resistivity (20 oC): 79 microOhm cm

    Melting point: 1545 oC
    Boiling point: 1950 oC

    Heat of fusion: 18.4 kJ/mol
    Heat of vaporization: 247 kJ/mol
    Heat of atomization: 233.43 kJ/mol
EOF
fi
if [[ $ELEMENT = "u" ]]; then
cat <<EOF

      U

    Relative atomic mass: 238.02891 +- 0.00003

    English: Uranium
    French: Uranium
    Croatian: Uranij
    German: Uran
    Italian: Uranio
    Spanish: Uranio

    Atomic number: 92
    Group numbers: 3
    Period: 7
    Standard state (20 oC): solid

    Discovery: 1789 Martin Heinrich Klaproth (DE)

Uranium was discovered by Martin Heinrich Klaproth (DE) in 1789. Named
after the planet 'Uranus'. It is a silvery-white, dense, ductile,
malleable, radioactive, radiotoxic metal that resists alkalis, tarnishes
in air and reacts with steam and acids. Uranium occurs in many rocks,
but in large amounts only in such minerals as pitchblende and carnotite.
For many centuries it was used as a pigment for glass. Now it is used as
a fuel in nuclear reactors and in bombs.

    Electronic configuration: [Rn] 5f3 6d1 7s2
    Formal oxidation number: +3 +4 +5 +6
    Atomic radius: 138.5 pm

    Electronegativities: 1.7
    Thermal conductivity: 27.6 W/(m K)
    Electrical resistivity (20 oC): 30 microOhm cm

    Melting point: 1135 oC
    Boiling point: 4131 oC

    Heat of fusion: 15.5 kJ/mol
    Heat of vaporization: 417.1 kJ/mol
    Heat of atomization: 535.43 kJ/mol
EOF
fi
if [[ $ELEMENT = "uuo" ]]; then
cat <<EOF

      Uuo

    Relative atomic mass: [...]

    English: Ununoctium
    French: Ununoctium
    Croatian: Ununoktij
    German: Ununoctium
    Italian: Ununoctio
    Spanish: Ununoctio

    Atomic number: 118
    Group numbers: 18
    Period: 7
    Standard state (20 oC): gas

    Discovery: - -

The name ununoctium is a systematic element name for the element 118,
used as a placeholder until the discovery is acknowledged by the IUPAC.

    Electronic configuration: [Rn] 5f14 6d10 7s2 7p6
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "uup" ]]; then
cat <<EOF

      Uup

    Relative atomic mass: [...]

    English: Ununpentium
    French: Ununpentium
    Croatian: Ununpentij
    German: Ununpentium
    Italian: Ununpentio
    Spanish: Ununpentio

    Atomic number: 115
    Group numbers: 15
    Period: 7
    Standard state (20 oC): solid

    Discovery: - -

The name ununpentium is a systematic element name for the element 115,
used as a placeholder until the discovery is acknowledged by the IUPAC.

    Electronic configuration: [Rn] 5f14 6d10 7s2 7p3
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "uus" ]]; then
cat <<EOF

      Uus

    Relative atomic mass: [...]

    English: Ununseptium
    French: Ununseptium
    Croatian: Ununseptij
    German: Ununseptium
    Italian: Ununseptio
    Spanish: Ununseptio

    Atomic number: 117
    Group numbers: 17
    Period: 7
    Standard state (20 oC): solid

    Discovery: - -

The name ununseptium is a systematic element name for the element 117,
used as a placeholder until the discovery is acknowledged by the IUPAC.

    Electronic configuration: [Rn] 5f14 6d10 7s2 7p5
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "uut" ]]; then
cat <<EOF

      Uut

    Relative atomic mass: [...]

    English: Ununtrium
    French: Ununtrium
    Croatian: Ununtrij
    German: Ununtrium
    Italian: Ununtrio
    Spanish: Ununtrio

    Atomic number: 113
    Group numbers: 13
    Period: 7
    Standard state (20 oC): solid

    Discovery: - -

The name ununtrium is a systematic element name for the element 113,
used as a placeholder until the discovery is acknowledged by the IUPAC.

    Electronic configuration: [Rn] 5f14 6d10 7s2 7p1
    Formal oxidation number: 
    Atomic radius: - pm

    Electronegativities: -
    Thermal conductivity: - W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: - oC
    Boiling point: - oC

    Heat of fusion: - kJ/mol
    Heat of vaporization: - kJ/mol
    Heat of atomization: - kJ/mol
EOF
fi
if [[ $ELEMENT = "v" ]]; then
cat <<EOF

      V

    Relative atomic mass: 50.9415 +- 0.0001

    English: Vanadium
    French: Vanadium
    Croatian: Vanadij
    German: Vanadium
    Italian: Vanadio
    Spanish: Vanadio

    Atomic number: 23
    Group numbers: 5
    Period: 4
    Standard state (20 oC): solid

    Discovery: 1801 Andres Manuel del Rio (MX)

Vanadium was discovered by Andres Manuel del Rio (MX) in 1801 and
rediscovered by Nils Gabriel Sefstrom (SE) in 1830. Named after
'Vanadis', the goddess of beauty in Scandinavian mythology. It is a
soft, ductile, silvery-white metal, resistant to corrosion by moisture,
air and most acids and alkalis at room temperature. Exposed surfaces
form oxide coating. It reacts with concentrated acids. Vanadium is found
in the minerals patronite (VS4), vanadinite [Pb5(VO4)3Cl] and carnotite
[K2(UO2)2(VO4)2.3H2O]. Pure metal produced by heating with C and Cl to
produce VCl3 which is heated with Mg in Ar atmosphere. It is mixed with
other metals to make very strong and durable alloys. Vanadium pentoxide
(V2O5) is used as a catalyst, dye and fixer-fixer.

    Electronic configuration: [Ar] 3d3 4s2
    Formal oxidation number: +2 +3 +4 +5
    Atomic radius: 131.1 pm

    Electronegativities: 1.63
    Thermal conductivity: 30.7 W/(m K)
    Electrical resistivity (20 oC): 19.68 microOhm cm

    Melting point: 1910 oC
    Boiling point: 3407 oC

    Heat of fusion: 17.6 kJ/mol
    Heat of vaporization: 459.7 kJ/mol
    Heat of atomization: 510.95 kJ/mol
EOF
fi
if [[ $ELEMENT = "w" ]]; then
cat <<EOF

      W

    Relative atomic mass: 183.84 +- 0.01

    English: Tungsten
    French: Tungstene
    Croatian: Volfram
    German: Wolfram
    Italian: Wolframio
    Spanish: Wolframio

    Atomic number: 74
    Group numbers: 6
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1783 Fausto Elhuyar, Juan Jose de Elhuyar (ES)

Tungsten was discovered by Fausto and Juan Jose de Elhuyar (ES) in 1783.
Named after the tungsten mineral 'wolframite'. It is a hard, steel-grey
to white metal that has the highest melting point of all metals.
Tungesten resists oxygen, acids and alkalis. Tungsten occurs in the
minerals scheelite (CaWO4) and wolframite [(Fe,Mn)WO4]. It is made into
filaments for vacuum tubes and electric lights it can also be used as
contact points in cars. Tungsten carbide is extremely hard and is used
for making cutting tools and abrasives.

    Electronic configuration: [Xe] 4f14 5d4 6s2
    Formal oxidation number: +6
    Atomic radius: 137 pm

    Electronegativities: 1.7
    Thermal conductivity: 174 W/(m K)
    Electrical resistivity (20 oC): 5.4 microOhm cm

    Melting point: 3422 oC
    Boiling point: 5555 oC

    Heat of fusion: 35.2 kJ/mol
    Heat of vaporization: 824.2 kJ/mol
    Heat of atomization: 848.1 kJ/mol
EOF
fi
if [[ $ELEMENT = "xe" ]]; then
cat <<EOF

      Xe

    Relative atomic mass: 131.293 +- 0.006

    English: Xenon
    French: Xenon
    Croatian: Ksenon
    German: Xenon
    Italian: Xeno
    Spanish: Xenon

    Atomic number: 54
    Group numbers: 18
    Period: 5
    Standard state (20 oC): gas

    Discovery: 1898 Sir William Ramsay, Morris William Travers (GB)

Xenon was discovered by Sir William Ramsay and Morris William Travers
(GB) in 1898. The origin of the name comes from the Greek word 'xenos'
meaning 'stranger'. It is a heavy, colourless, odourless, noble gas that
reacts only with fluorine. Xenon is obtain from the small quantities in
liquid air. It is used for filling flash lamps and other powerful lamps.
Electrical excitation of xenon produces a burst of brilliant white
light. It is also used in bubble chambers and modern nuclear power
reactors.

    Electronic configuration: [Kr] 4d10 5s2 5p6
    Formal oxidation number: 0
    Atomic radius: 216 pm

    Electronegativities: 2.6
    Thermal conductivity: 0.0056 W/(m K)
    Electrical resistivity (20 oC): - microOhm cm

    Melting point: -111.75 oC
    Boiling point: -108.0 oC

    Heat of fusion: 3.1 kJ/mol
    Heat of vaporization: 12.65 kJ/mol
    Heat of atomization: 0 kJ/mol
EOF
fi
if [[ $ELEMENT = "yb" ]]; then
cat <<EOF

      Yb

    Relative atomic mass: 173.04 +- 0.03

    English: Ytterbium
    French: Ytterbium
    Croatian: Iterbij
    German: Ytterbium
    Italian: Itterbio
    Spanish: Yterbio

    Atomic number: 70
    Group numbers: 3
    Period: 6
    Standard state (20 oC): solid

    Discovery: 1878 Jean Charles Galinard de Marignac (CH)

Ytterbium was discovered by Jean Charles Galinard de Marignac (CH) in
1878. Named after 'Ytterby', a village in Sweden. It is a silvery,
lustrous, malleable and ductile metal that oxidizes slowly in air and
reacts with water. Ytterbium dust is flammable. Ytterbium is found in
minerals such as yttria, monazite, gadolinite and xenotime. It is used
in metallurgical and chemical experiments.

    Electronic configuration: [Xe] 4f14 6s2
    Formal oxidation number: +2 +3
    Atomic radius: 194 pm

    Electronegativities: -
    Thermal conductivity: 34.9 W/(m K)
    Electrical resistivity (20 oC): 29 microOhm cm

    Melting point: 819 oC
    Boiling point: 1196 oC

    Heat of fusion: 9.2 kJ/mol
    Heat of vaporization: 159 kJ/mol
    Heat of atomization: 152.8 kJ/mol
EOF
fi
if [[ $ELEMENT = "y" ]]; then
cat <<EOF

      Y

    Relative atomic mass: 88.90585 +- 0.00002

    English: Yttrium
    French: Yttrium
    Croatian: Itrij
    German: Yttrium
    Italian: Ittrio
    Spanish: Ytrio

    Atomic number: 39
    Group numbers: 3
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1794 Johan Gadolin (FI)

Yttrium was discovered by Johan Gadolin (FI) in 1794. Named after
'Ytterby', a village in Sweden. It is a silvery, ductile, fairly
reactive metal that is easily combustible, reacts with oxygen in water
to release hydrogen. Exposed surfaces form oxide film. Yttrium is found
in minerals such as monazite, xenotime and yttria. It is combined with
europium to make red phosphors for colour TV's. Yttrium oxide and iron
oxide combine to form a crystal garnet used in radar.

    Electronic configuration: [Kr] 4d1 5s2
    Formal oxidation number: +3
    Atomic radius: 177.6 pm

    Electronegativities: 1.22
    Thermal conductivity: 17.2 W/(m K)
    Electrical resistivity (20 oC): 57 microOhm cm

    Melting point: 1522 oC
    Boiling point: 3345 oC

    Heat of fusion: 17.2 kJ/mol
    Heat of vaporization: 367.4 kJ/mol
    Heat of atomization: 420.45 kJ/mol
EOF
fi
if [[ $ELEMENT = "zn" ]]; then
cat <<EOF

      Zn

    Relative atomic mass: 65.409 +- 0.004

    English: Zinc
    French: Zinc
    Croatian: Cink
    German: Zink
    Italian: Zinco
    Spanish: Cinc

    Atomic number: 30
    Group numbers: 12
    Period: 4
    Standard state (20 oC): solid

    Discovery: - -

Zinc has been known since ancient times. The origin of the name comes
from the German word 'zink'. It is a bluish-silver, ductile metal that
reacts with alkalis and acids. Zinc tarnishes in air. Zinc is found in
the minerals zinc blende (sphalerite) (ZnS), calamine, franklinite,
smithsonite (ZnCO3), willemite and zincite (ZnO). It is used to coat
other metal (galvanizing) to protect them from rusting, 90% of the zinc
is used for galvanizing steel. Zinc metal is used in the common dry-cell
batteries and to make alloys such as brass, bronze. Zinc compounds are
used in the manufacture of paints, cosmetics, plastics, electronic
devices, and many other products.

    Electronic configuration: [Ar] 3d10 4s2
    Formal oxidation number: +2
    Atomic radius: 133.5 pm

    Electronegativities: 1.65
    Thermal conductivity: 116 W/(m K)
    Electrical resistivity (20 oC): 5.964 microOhm cm

    Melting point: 419.53 oC
    Boiling point: 907 oC

    Heat of fusion: 6.67 kJ/mol
    Heat of vaporization: 114.2 kJ/mol
    Heat of atomization: 130.181 kJ/mol
EOF
fi
if [[ $ELEMENT = "zr" ]]; then
cat <<EOF

      Zr

    Relative atomic mass: 91.224 +- 0.002

    English: Zirconium
    French: Zirconium
    Croatian: Cirkonij
    German: Zirkon
    Italian: Zirconio
    Spanish: Circonio

    Atomic number: 40
    Group numbers: 4
    Period: 5
    Standard state (20 oC): solid

    Discovery: 1789 Martin Heinrich Klaproth (DE)

Zirconium was discovered by Martin Heinrich Klaproth (DE) in 1789. The
origin of the name comes from the Arabic word 'zargun' meaning 'gold
colour'. It is a grey-white, lustrous, corrosion-resistant metal.
Exposed surfaces form oxide protective film. Zirconium is found in many
minerals such as zircon and baddeleyite. It is used in alloys such as
zircaloy which is used in nuclear applications since it does not readily
absorb neutrons. Zirconium is used in high-performance pumps and valves.
Clear zircon (ZrSiO4) is a popular gemstone.

    Electronic configuration: [Kr] 4d2 5s2
    Formal oxidation number: +4
    Atomic radius: 159 pm

    Electronegativities: 1.33
    Thermal conductivity: 22.7 W/(m K)
    Electrical resistivity (20 oC): 42.1 microOhm cm

    Melting point: 1855 oC
    Boiling point: 4409 oC

    Heat of fusion: 23 kJ/mol
    Heat of vaporization: 566.7 kJ/mol
    Heat of atomization: 607.47 kJ/mol
EOF
fi

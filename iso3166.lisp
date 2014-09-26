;;
;;  ISO 3166
;;  Codes for the representation of names of countries and their subdivisions.
;;
;;  Copyright 2014 Thomas de Grivel <thomas@lowh.net>
;;
;;  Permission to use, copy, modify, and distribute this software for any
;;  purpose with or without fee is hereby granted, provided that the above
;;  copyright notice and this permission notice appear in all copies.
;;
;;  THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
;;  WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
;;  MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
;;  ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
;;  WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
;;  ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
;;  OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;;

(in-package :cl-user)

(defpackage :iso3166
  (:use :cl)
  (:shadow #:AND #:DO)
  (:export
   #:*countries* #:country #:country-alpha3 #:country-alpha2
   #:country-numeric #:country-name
   #:AD #:AE #:AF #:AG #:AI #:AL #:AM #:AO #:AQ #:AR #:AS #:AT #:AU #:AW
   #:AX #:AZ #:BA #:BB #:BD #:BE #:BF #:BG #:BH #:BI #:BJ #:BL #:BM #:BN
   #:BO #:BQ #:BR #:BS #:BT #:BV #:BW #:BY #:BZ #:CA #:CC #:CD #:CF #:CG
   #:CH #:CI #:CK #:CL #:CM #:CN #:CO #:CR #:CU #:CV #:CW #:CX #:CY #:CZ
   #:DE #:DJ #:DK #:DM #:DO #:DZ #:EC #:EE #:EG #:EH #:ER #:ES #:ET #:FI
   #:FJ #:FK #:FM #:FO #:FR #:GA #:GB #:GD #:GE #:GF #:GG #:GH #:GI #:GL
   #:GM #:GN #:GP #:GQ #:GR #:GS #:GT #:GU #:GW #:GY #:HK #:HM #:HN #:HR
   #:HT #:HU #:ID #:IE #:IL #:IM #:IN #:IO #:IQ #:IR #:IS #:IT #:JE #:JM
   #:JO #:JP #:KE #:KG #:KH #:KI #:KM #:KN #:KP #:KR #:KW #:KY #:KZ #:LA
   #:LB #:LC #:LI #:LK #:LR #:LS #:LT #:LU #:LV #:LY #:MA #:MC #:MD #:ME
   #:MF #:MG #:MH #:MK #:ML #:MM #:MN #:MO #:MP #:MQ #:MR #:MS #:MT #:MU
   #:MV #:MW #:MX #:MY #:MZ #:NA #:NC #:NE #:NF #:NG #:NI #:NL #:NO #:NP
   #:NR #:NU #:NZ #:OM #:PA #:PE #:PF #:PG #:PH #:PK #:PL #:PM #:PN #:PR
   #:PS #:PT #:PW #:PY #:QA #:RE #:RO #:RS #:RU #:RW #:SA #:SB #:SC #:SD
   #:SE #:SG #:SH #:SI #:SJ #:SK #:SL #:SM #:SN #:SO #:SR #:SS #:ST #:SV
   #:SX #:SY #:SZ #:TC #:TD #:TF #:TG #:TH #:TJ #:TK #:TL #:TM #:TN #:TO
   #:TR #:TT #:TV #:TW #:TZ #:UA #:UG #:UM #:US #:UY #:UZ #:VA #:VC #:VE
   #:VG #:VI #:VN #:VU #:WF #:WS #:YE #:YT #:ZA #:ZM #:ZW
   #:ABW #:AFG #:AGO #:AIA #:ALA #:ALB #:AND #:ARE #:ARG #:ARM #:ASM #:ATA
   #:ATF #:ATG #:AUS #:AUT #:AZE #:BDI #:BEL #:BEN #:BES #:BFA #:BGD #:BGR
   #:BHR #:BHS #:BIH #:BLM #:BLR #:BLZ #:BMU #:BOL #:BRA #:BRB #:BRN #:BTN
   #:BVT #:BWA #:CAF #:CAN #:CCK #:CHE #:CHL #:CHN #:CIV #:CMR #:COD #:COG
   #:COK #:COL #:COM #:CPV #:CRI #:CUB #:CUW #:CXR #:CYM #:CYP #:CZE #:DEU
   #:DJI #:DMA #:DNK #:DOM #:DZA #:ECU #:EGY #:ERI #:ESH #:ESP #:EST #:ETH
   #:FIN #:FJI #:FLK #:FRA #:FRO #:FSM #:GAB #:GBR #:GEO #:GGY #:GHA #:GIB
   #:GIN #:GLP #:GMB #:GNB #:GNQ #:GRC #:GRD #:GRL #:GTM #:GUF #:GUM #:GUY
   #:HKG #:HMD #:HND #:HRV #:HTI #:HUN #:IDN #:IMN #:IND #:IOT #:IRL #:IRN
   #:IRQ #:ISL #:ISR #:ITA #:JAM #:JEY #:JOR #:JPN #:KAZ #:KEN #:KGZ #:KHM
   #:KIR #:KNA #:KOR #:KWT #:LAO #:LBN #:LBR #:LBY #:LCA #:LIE #:LKA #:LSO
   #:LTU #:LUX #:LVA #:MAC #:MAF #:MAR #:MCO #:MDA #:MDG #:MDV #:MEX #:MHL
   #:MKD #:MLI #:MLT #:MMR #:MNE #:MNG #:MNP #:MOZ #:MRT #:MSR #:MTQ #:MUS
   #:MWI #:MYS #:MYT #:NAM #:NCL #:NER #:NFK #:NGA #:NIC #:NIU #:NLD #:NOR
   #:NPL #:NRU #:NZL #:OMN #:PAK #:PAN #:PCN #:PER #:PHL #:PLW #:PNG #:POL
   #:PRI #:PRK #:PRT #:PRY #:PSE #:PYF #:QAT #:REU #:ROU #:RUS #:RWA #:SAU
   #:SDN #:SEN #:SGP #:SGS #:SHN #:SJM #:SLB #:SLE #:SLV #:SMR #:SOM #:SPM
   #:SRB #:SSD #:STP #:SUR #:SVK #:SVN #:SWE #:SWZ #:SXM #:SYC #:SYR #:TCA
   #:TCD #:TGO #:THA #:TJK #:TKL #:TKM #:TLS #:TON #:TTO #:TUN #:TUR #:TUV
   #:TWN #:TZA #:UGA #:UKR #:UMI #:URY #:USA #:UZB #:VAT #:VCT #:VEN #:VGB
   #:VIR #:VNM #:VUT #:WLF #:WSM #:YEM #:ZAF #:ZMB #:ZWE))

(in-package :iso3166)

(defclass country ()
  ((alpha3 :type symbol
	   :initarg :alpha3
	   :reader country-alpha3)
   (alpha2 :type symbol
	   :initarg :alpha2
	   :reader country-alpha2)
   (numeric :type (integer 1 999)
	    :initarg :numeric
	    :reader country-numeric)
   (name :type string
	 :initarg :name
	 :reader country-name)))

(defmethod print-object ((c country) stream)
  (if *print-readably*
      (print-unreadable-object (c stream :type t :identity t)
	(format stream "~A ~A ~3,'0D ~S"
		(country-alpha3 c)
		(country-alpha2 c)
		(country-numeric c)
		(country-name c)))
      (prin1 (country-alpha2 c) stream)))

(defmacro define-country (alpha3 alpha2 numeric name)
  (assert (= 3 (length (symbol-name alpha3))))
  (assert (= 2 (length (symbol-name alpha2))))
  (assert (eq (find-package :iso3166)
	      (symbol-package alpha3)))
  (assert (eq (find-package :iso3166)
	      (symbol-package alpha2)))
  `(let ((c (make-instance 'country
			   :alpha3 ',alpha3
			   :alpha2 ',alpha2
			   :numeric ,numeric
			   :name ,name)))
     (unless (boundp ',alpha3)
       (defconstant ,alpha3 c))
     (unless (boundp ',alpha2)
       (defconstant ,alpha2 c))
     c))

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defparameter *rt-stack* nil)
  (push *readtable* *rt-stack*)
  (setq *readtable* (copy-readtable))
  (set-macro-character
   #\[
   (lambda (stream char)
     (declare (ignore char))
     `(list
       ,@(loop until (cl:and (char= #\] (peek-char t stream))
			     (read-char stream))
	    for alpha3 = (read stream)
	    for alpha2 = (read stream)
	    for numeric = (read stream)
	    for name = (read stream)
	    collect `(define-country ,alpha3 ,alpha2 ,numeric ,name))))))

(defvar *countries* [
  AFG AF 004 "Afghanistan"
  ALA AX 248 "Åland Islands"
  ALB AL 008 "Albania"
  DZA DZ 012 "Algeria"
  ASM AS 016 "American Samoa"
  AND AD 020 "Andorra"
  AGO AO 024 "Angola"
  AIA AI 660 "Anguilla"
  ATA AQ 010 "Antarctica"
  ATG AG 028 "Antigua and Barbuda"
  ARG AR 032 "Argentina"
  ARM AM 051 "Armenia"
  ABW AW 533 "Aruba"
  AUS AU 036 "Australia"
  AUT AT 040 "Austria"
  AZE AZ 031 "Azerbaijan"
  BHS BS 044 "Bahamas (the)"
  BHR BH 048 "Bahrain"
  BGD BD 050 "Bangladesh"
  BRB BB 052 "Barbados"
  BLR BY 112 "Belarus"
  BEL BE 056 "Belgium"
  BLZ BZ 084 "Belize"
  BEN BJ 204 "Benin"
  BMU BM 060 "Bermuda"
  BTN BT 064 "Bhutan"
  BOL BO 068 "Bolivia, Plurinational State of"
  BES BQ 535 "Bonaire, Sint Eustatius and Saba"
  BIH BA 070 "Bosnia and Herzegovina"
  BWA BW 072 "Botswana"
  BVT BV 074 "Bouvet Island"
  BRA BR 076 "Brazil"
  IOT IO 086 "British Indian Ocean Territory (the)"
  BRN BN 096 "Brunei Darussalam"
  BGR BG 100 "Bulgaria"
  BFA BF 854 "Burkina Faso"
  BDI BI 108 "Burundi"
  KHM KH 116 "Cambodia"
  CMR CM 120 "Cameroon"
  CAN CA 124 "Canada"
  CPV CV 132 "Cape Verde"
  CYM KY 136 "Cayman Islands (the)"
  CAF CF 140 "Central African Republic (the)"
  TCD TD 148 "Chad"
  CHL CL 152 "Chile"
  CHN CN 156 "China"
  CXR CX 162 "Christmas Island"
  CCK CC 166 "Cocos (Keeling) Islands (the)"
  COL CO 170 "Colombia"
  COM KM 174 "Comoros"
  COG CG 178 "Congo"
  COD CD 180 "Congo (the Democratic Republic of the)"
  COK CK 184 "Cook Islands (the)"
  CRI CR 188 "Costa Rica"
  HRV HR 191 "Croatia"
  CUB CU 192 "Cuba"
  CUW CW 531 "Curaçao"
  CYP CY 196 "Cyprus"
  CZE CZ 203 "Czech Republic (the)"
  CIV CI 384 "Côte d'Ivoire"
  DNK DK 208 "Denmark"
  DJI DJ 262 "Djibouti"
  DMA DM 212 "Dominica"
  DOM DO 214 "Dominican Republic (the)"
  ECU EC 218 "Ecuador"
  EGY EG 818 "Egypt"
  SLV SV 222 "El Salvador"
  GNQ GQ 226 "Equatorial Guinea"
  ERI ER 232 "Eritrea"
  EST EE 233 "Estonia"
  ETH ET 231 "Ethiopia"
  FLK FK 238 "Falkland Islands (the) [Malvinas]"
  FRO FO 234 "Faroe Islands (the)"
  FJI FJ 242 "Fiji"
  FIN FI 246 "Finland"
  FRA FR 250 "France"
  GUF GF 254 "French Guiana"
  PYF PF 258 "French Polynesia"
  ATF TF 260 "French Southern Territories (the)"
  GAB GA 266 "Gabon"
  GMB GM 270 "Gambia (The)"
  GEO GE 268 "Georgia"
  DEU DE 276 "Germany"
  GHA GH 288 "Ghana"
  GIB GI 292 "Gibraltar"
  GRC GR 300 "Greece"
  GRL GL 304 "Greenland"
  GRD GD 308 "Grenada"
  GLP GP 312 "Guadeloupe"
  GUM GU 316 "Guam"
  GTM GT 320 "Guatemala"
  GGY GG 831 "Guernsey"
  GIN GN 324 "Guinea"
  GNB GW 624 "Guinea-Bissau"
  GUY GY 328 "Guyana"
  HTI HT 332 "Haiti"
  HMD HM 334 "Heard Island and McDonald Islands"
  VAT VA 336 "Holy See (the) [Vatican City State]"
  HND HN 340 "Honduras"
  HKG HK 344 "Hong Kong"
  HUN HU 348 "Hungary"
  ISL IS 352 "Iceland"
  IND IN 356 "India"
  IDN ID 360 "Indonesia"
  IRN IR 364 "Iran (the Islamic Republic of)"
  IRQ IQ 368 "Iraq"
  IRL IE 372 "Ireland"
  IMN IM 833 "Isle of Man"
  ISR IL 376 "Israel"
  ITA IT 380 "Italy"
  JAM JM 388 "Jamaica"
  JPN JP 392 "Japan"
  JEY JE 832 "Jersey"
  JOR JO 400 "Jordan"
  KAZ KZ 398 "Kazakhstan"
  KEN KE 404 "Kenya"
  KIR KI 296 "Kiribati"
  PRK KP 408 "Korea (the Democratic People's Republic of)"
  KOR KR 410 "Korea (the Republic of)"
  KWT KW 414 "Kuwait"
  KGZ KG 417 "Kyrgyzstan"
  LAO LA 418 "Lao People's Democratic Republic (the)"
  LVA LV 428 "Latvia"
  LBN LB 422 "Lebanon"
  LSO LS 426 "Lesotho"
  LBR LR 430 "Liberia"
  LBY LY 434 "Libya"
  LIE LI 438 "Liechtenstein"
  LTU LT 440 "Lithuania"
  LUX LU 442 "Luxembourg"
  MAC MO 446 "Macao"
  MKD MK 807 "Macedonia (the former Yugoslav Republic of)"
  MDG MG 450 "Madagascar"
  MWI MW 454 "Malawi"
  MYS MY 458 "Malaysia"
  MDV MV 462 "Maldives"
  MLI ML 466 "Mali"
  MLT MT 470 "Malta"
  MHL MH 584 "Marshall Islands (the)"
  MTQ MQ 474 "Martinique"
  MRT MR 478 "Mauritania"
  MUS MU 480 "Mauritius"
  MYT YT 175 "Mayotte"
  MEX MX 484 "Mexico"
  FSM FM 583 "Micronesia (the Federated States of)"
  MDA MD 498 "Moldova (the Republic of)"
  MCO MC 492 "Monaco"
  MNG MN 496 "Mongolia"
  MNE ME 499 "Montenegro"
  MSR MS 500 "Montserrat"
  MAR MA 504 "Morocco"
  MOZ MZ 508 "Mozambique"
  MMR MM 104 "Myanmar"
  NAM NA 516 "Namibia"
  NRU NR 520 "Nauru"
  NPL NP 524 "Nepal"
  NLD NL 528 "Netherlands (the)"
  NCL NC 540 "New Caledonia"
  NZL NZ 554 "New Zealand"
  NIC NI 558 "Nicaragua"
  NER NE 562 "Niger (the)"
  NGA NG 566 "Nigeria"
  NIU NU 570 "Niue"
  NFK NF 574 "Norfolk Island"
  MNP MP 580 "Northern Mariana Islands (the)"
  NOR NO 578 "Norway"
  OMN OM 512 "Oman"
  PAK PK 586 "Pakistan"
  PLW PW 585 "Palau"
  PSE PS 275 "Palestine, State of"
  PAN PA 591 "Panama"
  PNG PG 598 "Papua New Guinea"
  PRY PY 600 "Paraguay"
  PER PE 604 "Peru"
  PHL PH 608 "Philippines (the)"
  PCN PN 612 "Pitcairn"
  POL PL 616 "Poland"
  PRT PT 620 "Portugal"
  PRI PR 630 "Puerto Rico"
  QAT QA 634 "Qatar"
  ROU RO 642 "Romania"
  RUS RU 643 "Russian Federation (the)"
  RWA RW 646 "Rwanda"
  REU RE 638 "Réunion"
  BLM BL 652 "Saint Barthélemy"
  SHN SH 654 "Saint Helena, Ascension and Tristan da Cunha"
  KNA KN 659 "Saint Kitts and Nevis"
  LCA LC 662 "Saint Lucia"
  MAF MF 663 "Saint Martin (French part)"
  SPM PM 666 "Saint Pierre and Miquelon"
  VCT VC 670 "Saint Vincent and the Grenadines"
  WSM WS 882 "Samoa"
  SMR SM 674 "San Marino"
  STP ST 678 "Sao Tome and Principe"
  SAU SA 682 "Saudi Arabia"
  SEN SN 686 "Senegal"
  SRB RS 688 "Serbia"
  SYC SC 690 "Seychelles"
  SLE SL 694 "Sierra Leone"
  SGP SG 702 "Singapore"
  SXM SX 534 "Sint Maarten (Dutch part)"
  SVK SK 703 "Slovakia"
  SVN SI 705 "Slovenia"
  SLB SB 090 "Solomon Islands (the)"
  SOM SO 706 "Somalia"
  ZAF ZA 710 "South Africa"
  SGS GS 239 "South Georgia and the South Sandwich Islands"
  SSD SS 728 "South Sudan"
  ESP ES 724 "Spain"
  LKA LK 144 "Sri Lanka"
  SDN SD 729 "Sudan (the)"
  SUR SR 740 "Suriname"
  SJM SJ 744 "Svalbard and Jan Mayen"
  SWZ SZ 748 "Swaziland"
  SWE SE 752 "Sweden"
  CHE CH 756 "Switzerland"
  SYR SY 760 "Syrian Arab Republic (the)"
  TWN TW 158 "Taiwan (Province of China)"
  TJK TJ 762 "Tajikistan"
  TZA TZ 834 "Tanzania, United Republic of"
  THA TH 764 "Thailand"
  TLS TL 626 "Timor-Leste"
  TGO TG 768 "Togo"
  TKL TK 772 "Tokelau"
  TON TO 776 "Tonga"
  TTO TT 780 "Trinidad and Tobago"
  TUN TN 788 "Tunisia"
  TUR TR 792 "Turkey"
  TKM TM 795 "Turkmenistan"
  TCA TC 796 "Turks and Caicos Islands (the)"
  TUV TV 798 "Tuvalu"
  UGA UG 800 "Uganda"
  UKR UA 804 "Ukraine"
  ARE AE 784 "United Arab Emirates (the)"
  GBR GB 826 "United Kingdom (the)"
  USA US 840 "United States (the)"
  UMI UM 581 "United States Minor Outlying Islands (the)"
  URY UY 858 "Uruguay"
  UZB UZ 860 "Uzbekistan"
  VUT VU 548 "Vanuatu"
  VEN VE 862 "Venezuela, Bolivarian Republic of"
  VNM VN 704 "Viet Nam"
  VGB VG 092 "Virgin Islands (British)"
  VIR VI 850 "Virgin Islands (U.S.)"
  WLF WF 876 "Wallis and Futuna"
  ESH EH 732 "Western Sahara"
  YEM YE 887 "Yemen"
  ZMB ZM 894 "Zambia"
  ZWE ZW 716 "Zimbabwe"
  ])

(eval-when (:compile-toplevel :load-toplevel :execute)
  (loop while *rt-stack*
     do (setq *readtable* (pop *rt-stack*))))

(defgeneric country (x))

(defmethod country ((x string))
  (or (when (<= 2 (length x) 3)
	(let* ((sym (find-symbol (string-upcase x) :iso3166))
	       (val (when sym (symbol-value sym))))
	   (when (typep val 'country)
	     val)))
      (find x *countries*
	    :key #'country-name
	    :test #'string-equal)))

(defmethod country ((x integer))
  (find x *countries*
	:key #'country-numeric
	:test #'=))

(defmethod country ((x country))
  x)

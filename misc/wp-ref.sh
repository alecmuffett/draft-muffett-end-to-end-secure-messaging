#!/bin/sh

wikiref() {
    slug=$1
    shift
    case "x$1" in
	x-) shift ; anchor=`echo "$@" | tr -cd 'A-Za-z'` ;;
	*) anchor=$1 ; shift ;;
    esac
    title="$@"
    echo "<reference anchor='$anchor' target='https://en.wikipedia.org/wiki/$slug'>"
    echo "    <front>"
    echo "        <title>$title</title>"
    echo "        <author fullname=\"Wikipedia\"></author>"
    echo "        <date year='2021'/>"
    echo "    </front>"
    echo "</reference>"
    echo ""
}

echo ""

wikiref 'BREACH' - BREACH
wikiref 'Ciphertext_indistinguishability' CipherInd Ciphertext indistinguishability
wikiref 'Clipper_chip' Clipper Clipper chip
wikiref 'Crypto_Wars' - Crypto Wars
wikiref 'Dual-use_technology' DualUse Dual-use technology
wikiref 'Export_of_cryptography_from_the_United_States#Cold_War_era' ExportControl Export of cryptography from the United States
wikiref 'Logjam_(computer_security)' - Logjam
wikiref 'Meltdown_(security_vulnerability)' - Meltdown
wikiref 'Spectre_(security_vulnerability)' - Spectre
wikiref 'Trusted_computing_base' - Trusted Computing Base

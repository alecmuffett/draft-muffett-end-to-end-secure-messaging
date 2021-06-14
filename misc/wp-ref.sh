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


wikiref Trusted_computing_base - Trusted Computing Base

wikiref Dual-use_technology DualUse Dual-use technology

wikiref 'Export_of_cryptography_from_the_United_States#Cold_War_era' ExportControl Export of cryptography from the United States

wikiref BREACH - BREACH

wikiref Ciphertext_indistinguishability CipherInd Ciphertext indistinguishability

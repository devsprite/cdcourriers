<div style="font-size: 10pt; color: #444">
    <table style="width: 100%">
        <tr>
            <td style="height: 760px">

                <table style="font-size: 12pt; line-height: 1pt;text-align: justify">
                    <tr>
                        <td style="width: 50%"></td>
                        <td style="width: 50%;text-align: left;">
                            <span style="font-weight: bold; font-size: 12pt;">{$gender} {$customer->lastname|upper|escape:'htmlall':'UTF-8'}
                                {$customer->firstname|lower|capitalize|escape:'htmlall':'UTF-8'}</span>
                            <br>
                            <span>{$address['address1']|strip|escape:'htmlall':'UTF-8'}</span>
                            <br>
                            {if !empty($address['address2'])}{$address['address2']|strip|escape:'htmlall':'UTF-8'}<br>{/if}
                            <span>{$address['postcode']|strip|escape:'htmlall':'UTF-8'} {$address['city']|strip|lower|capitalize|escape:'htmlall':'UTF-8'}</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 40pt"></td>
                    </tr>
                    <tr>
                        <td style="font-weight:bolder; font-size: 12pt;line-height: 1pt" colspan="2">Objet : Relance, commande impayée,
                            facture ci-joint <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Montpellier, le {$smarty.now|date_format:'%A %e %B %Y'|escape:'htmlall':'UTF-8'}.</td>
                    </tr>
                    <tr>
                        <td style="height: 30pt"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">{$gender} {$customer->lastname|upper|escape:'htmlall':'UTF-8'}, <br></td>
                    </tr>
                    <tr>
                        <td style="height: 30pt"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Mes précédants emails concernant le non paiement de
                            votre commande sont resté
                            sans réponse. <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">A ce jour, vous nous êtes toujours redevable du solde
                            de votre commande. <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Je vous rappelle que cette facture est due à partir
                            du moment où vous avez bien réceptionné la marchandise, ce dont nous avons la preuve. <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">De plus d'après nos conditions générale de vente,
                            "Le défaut de paiement à échéance de nos produits pourra entraîner des pénalités de retard
                            d'un montant égal à (3) trois fois le taux d'intérêt légal, et le versement d'une idemnité
                            forfaitaire de 30% de la créance due à titre de clause pénale." <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Le délai imparti étant dépassé, je vous demande de
                            bien vouloir régulariser cette situation dès réception de ce courrier ou, au minimum, de
                            prendre contact avec nous rapidement pour trouver une solution au 04 30 96 66 60. <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Sans nouvelle de votre part sous 8 jours, nous
                            serions contraints de poursuivre la procédure légale et nous transmettrons votre dossier
                            au service recouvrement. <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Dans le cas où votre règlement aurait été adressé
                            entre temps, nous vous prions de ne pas tenir compte de la présente. <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Veuillez agréer {$gender}, l'expression de mes salutations
                            distinguées. <br><br>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 60%"></td>
                        <td style="width: 40%">Charlotte Cail<br>Service Comptabilité L&Sens <br><br></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">PS : je ne souhaite absolument pas que nous en
                            arrivions là, appelez moi vite que nous trouvions une solution. Bien à vous.</td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
</div>
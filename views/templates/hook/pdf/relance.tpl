{**
 * 2007-2016 PrestaShop
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the Academic Free License (AFL 3.0)
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * http://opensource.org/licenses/afl-3.0.php
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to license@prestashop.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://www.prestashop.com for more information.
 *
 * @author    Dominique <dominique@chez-dominique.fr>
 * @copyright 2007-2016 PrestaShop SA / 2011-2016 Dominique
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 * International Registred Trademark & Property of PrestaShop SA
 *}
<div style="font-size: 10pt; color: #444">
    <table style="width: 100%">
        <tr>
            <td style="height: 760px">

                <table style="font-size: 12pt; line-height: 1pt;text-align: justify">
                    <tr>
                        <td style="width: 50%"></td>
                        <td style="width: 50%;text-align: left;">
                            <span style="font-weight: bold; font-size: 12pt;">{$gender|escape:'htmlall':'UTF-8'} {$customer->lastname|upper|escape:'htmlall':'UTF-8'}
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
                        <td colspan="2" style="line-height: 1pt">{$gender|escape:'htmlall':'UTF-8'} {$customer->lastname|upper|escape:'htmlall':'UTF-8'}, <br></td>
                    </tr>
                    <tr>
                        <td style="height: 30pt"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Mes précédants emails concernant le non paiement de
                            votre commande n° {$order->id|escape:'htmlall':'UTF-8'} du {$order->date_add|date_format:'%A %e %B %Y'|escape:'htmlall':'UTF-8'} sont resté sans réponse. <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">A ce jour, vous nous êtes toujours redevable <span style="font-weight: bold;">de la somme de {$total_paid|escape:'htmlall':'UTF-8'}</span><br>
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
                        <td colspan="2" style="line-height: 1pt">Veuillez agréer {$gender|escape:'htmlall':'UTF-8'}, l'expression de mes salutations
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
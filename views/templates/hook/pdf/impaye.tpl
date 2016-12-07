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

                <table style="font-size: 11pt; line-height: 1pt;text-align: justify">
                    <tr>
                        <td style="width: 50%"></td>
                        <td style="width: 50%;text-align: left;">
                            <span style="font-weight: bold; font-size: 11pt;">{$gender|escape:'htmlall':'UTF-8'} {$customer->lastname|upper|escape:'htmlall':'UTF-8'}
                                {$customer->firstname|lower|capitalize|escape:'htmlall':'UTF-8'}</span>
                            <br>
                            <span>{$address['address1']|strip|escape:'htmlall':'UTF-8'}</span>
                            <br>
                            {if !empty($address['address2'])}{$address['address2']|strip|escape:'htmlall':'UTF-8'}<br>{/if}
                            <span>{$address['postcode']|strip|escape:'htmlall':'UTF-8'} {$address['city']|strip|lower|capitalize|escape:'htmlall':'UTF-8'}</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 25pt"></td>
                    </tr>
                    <table>
                        <tr>
                            <td colspan="3" style="text-align: center;">*******************************************************************************************************************</td>
                        </tr>
                        <tr>
                            <td style="width: 1%;text-align: center;">*</td>
                            <td style="text-align: center; width: 98%"></td>
                            <td style="width: 1%;text-align: center">*</td>
                        </tr>
                        <tr>
                            <td style="width: 1%;text-align: center;">*</td>
                            <td style="text-align: center; width: 98%">MISE EN DEMEURE DE PAIEMENT</td>
                            <td style="width: 1%;text-align: center">*</td>
                        </tr>
                        <tr>
                            <td style="width: 1%;text-align: center;">*</td>
                            <td style="text-align: center; width: 98%"></td>
                            <td style="width: 1%;text-align: center">*</td>
                        </tr>
                        <tr>
                            <td colspan="3" style="text-align: center;">*******************************************************************************************************************</td>
                        </tr>
                    </table>
                    <tr>
                        <td style="height: 25pt"></td>
                    </tr>
                    <tr>
                        <td style="font-weight:bolder; font-size: 11pt;line-height: 1pt" colspan="2">{if !empty($lrar)}LRAR N° {$lrar}
                            <br>+ copie en lettre simple
                            <br>{/if}Dossier n° : {$order->id}
                            <br>Pièce jointe : copie de la facture
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 25pt"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Montpellier, le {$smarty.now|date_format:'%A %e %B %Y'|escape:'htmlall':'UTF-8'}.</td>
                    </tr>
                    <tr>
                        <td style="height: 12pt"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">{$gender|escape:'htmlall':'UTF-8'} {$customer->lastname|upper|escape:'htmlall':'UTF-8'},</td>
                    </tr>
                    <tr>
                        <td style="height: 12pt"></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Nous constatons avec regret qu'en dépit de nos emails et courriers
                            de relance vous n'avez toujours pas procédé au règlement de notre facture n° FA {$order->invoice_number|escape:'htmlall':'UTF-8'}
                            suite à votre commande n° {$order->id|escape:'htmlall':'UTF-8'} du {$order->date_add|date_format:'%A %e %B %Y'|escape:'htmlall':'UTF-8'}.<br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Votre dossier nous a été transmis afin que nous procédions à son
                            recouvrement.<br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">En conséquence, nous vous mettons en demeure de nous régler la
                            somme de {$total_paid|escape:'htmlall':'UTF-8'}, dans un délai de 48 heures à réception de la présente.<br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Nous vous informons qu'en parallèle, une injonction de paiement a
                            été demandée au tribunal de Montpellier.<br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Nous vous rappelons que le présent courrier fait courir les intérêts
                            légaux et conventionnels.<br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Vous pouvez éffectuer votre règlement par :<br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt; font-size: 11pt">
                            <ul>
                                <li>Chèque bancaire à l'ordre de L&Sens - 91, rue de Font Caude - 34080 Montpellier.</li>
                                <li>Carte bancaire en appelant le service recouvrement au 04 30 96 66 00.</li>
                                <li>Virement bancaire en indiquant votre numéro de commande dans l'intitulé, RIB :
                                    13485-00800-08001157861-88 CE LANGUEDOC ROUSSILLON.</li>
                                <li>Mandat cash adressé à L&Sens - 91, rue de Font Caude - 34080 Montpellier.</li>
                            </ul>
                            <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Dans le cas où votre règlement aurait été adressé entre temps, nous
                            vous prions de ne pas tenir compte de la présente. <br>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" style="line-height: 1pt">Veuillez agréer {$gender|escape:'htmlall':'UTF-8'}, l'expression de mes salutations
                            distinguées. <br><br>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 60%"></td>
                        <td style="width: 40%">Mr Roger Drowski<br>Service contentieux<br>04 30 96 66 00</td>
                    </tr>
                </table>

            </td>
        </tr>
    </table>
</div>
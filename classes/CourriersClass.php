<?php
/**
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
 * @copyright 2007-2016 Chez-dominique
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

require_once(dirname(__FILE__) . '/MypdfClass.php');

class CourriersClass
{
    public static function generateRelance($id_orders, $id_lang)
    {
        $pdf = new MypdfClass('P', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
        foreach ($id_orders as $id_order) {
            $order = new Order($id_order);
            $customer = new Customer($order->id_customer);
            $address = $customer->getAddresses($id_lang);
            CourriersClass::generatePDF($order, $customer, $address, $id_lang, $pdf);
        }
        if (count($id_orders) > 1) {
            $filename = date('Y-m-d-U_') . 'Relances' . '.pdf';
            $fileNL = _PS_DOWNLOAD_DIR_ . $filename;

            $pdf->Output($fileNL, 'F');
            $pdf->Output($filename, 'D');
        } else {
            $filename = date('Y-m-d-U_') . 'Relance_' . $order->id . '_' . $customer->lastname . '.pdf';
            $fileNL = _PS_DOWNLOAD_DIR_ . $filename;

            $pdf->Output($fileNL, 'F');
            $pdf->Output($filename, 'D');
        }
    }


    public static function generateImpaye($id_order, $lrar, $id_lang)
    {
        $pdf = new MypdfClass('P', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
            $order = new Order($id_order);
            $customer = new Customer($order->id_customer);
            $address = $customer->getAddresses($id_lang);
            CourriersClass::generatePDF($order, $customer, $address, $id_lang, $pdf, 'impaye', $lrar);

            $filename = date('Y-m-d-U_') . 'Impaye_' . $order->id . '_' . $customer->lastname . '.pdf';
            $fileNL = _PS_DOWNLOAD_DIR_ . $filename;

            $pdf->Output($fileNL, 'F');
            $pdf->Output($filename, 'D');
    }

    private static function generatePDF(
        Order $order,
        Customer $customer,
        $address,
        $id_lang,
        MypdfClass $pdf,
        $type = 'relance',
        $lrar = 0
    ) {

        // set document information
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('L&Sens');
        $pdf->SetTitle('Module Courriers');
        $pdf->SetSubject('Module Courriers');

        // remove default header/footer
        $pdf->setPrintHeader(false);
        $pdf->setPrintFooter(false);


        // set default monospaced font
        $pdf->SetDefaultMonospacedFont(PDF_FONT_MONOSPACED);

        // set margins
        $pdf->SetMargins(PDF_MARGIN_LEFT, PDF_MARGIN_TOP, PDF_MARGIN_RIGHT);

        // set auto page breaks
        $pdf->SetAutoPageBreak(true, 10);

        // set image scale factor
        $pdf->setImageScale(PDF_IMAGE_SCALE_RATIO);

        $l = '';
        // set some language-dependent strings (optional)
        if (@file_exists(dirname(__FILE__) . '/lang/fr.php')) {
            require_once(dirname(__FILE__) . '/lang/fr.php');
            $pdf->setLanguageArray($l);
        }

        // ---------------------------------------------------------

        // set font
        $pdf->SetFont('helvetica', '', 20);
        $pdf->SetMargins(15, 10, 15, true);


        $genders = Gender::getGenders($id_lang);
        $titles = array();
        foreach ($genders as $gender) {
            $titles[$gender->id_gender] = $gender->name;
        }

        $smarty = new Smarty();
        $smarty->assign(array(
            'path_img' => _PS_MODULE_DIR_ . 'cdcourriers/views/img/',
            'order' => $order,
            'customer' => $customer,
            'address' => $address[0],
            'gender' => $titles[$customer->id_gender],
            'lrar' => $lrar,
            'total_paid' => Tools::displayPrice(($order->total_paid_tax_incl - $order->getTotalPaid())),
        ));
        // set some text to print
        // add a page
        if ($type == 'relance') {
            $pdf->AddPage();
            $html_content = $smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/header.tpl');
            $html_content .= $smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/relance.tpl');
            $html_content .= $smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/footer.tpl');
            $pdf->writeHTML($html_content);

            $pdf->AddPage();
            $html_content = $smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/header.tpl');
            $html_content .= $smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/relance_verso.tpl');
            $html_content .= $smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/footer.tpl');
            $pdf->writeHTML($html_content);
        } else {
            $pdf->AddPage();
            $html_content = $smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/header.tpl');
            $html_content .= $smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/impaye.tpl');
            $html_content .= $smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/footer.tpl');
            $pdf->writeHTML($html_content);
        }

        // ---------------------------------------------------------

        //Close and output PDF document
        return $pdf;
    }
}

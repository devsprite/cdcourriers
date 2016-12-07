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
 * @copyright 2007-2016 Chez-Dominique
 * @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

require_once(dirname(__FILE__) . '/classes/MypdfClass.php');
require_once(dirname(__FILE__) . '/classes/CourriersClass.php');

class Cdcourriers extends Module
{

    protected $errors = array();
    protected $html = '';

    protected $config = array(
        'cdcourriers' => 1,
    );

    protected $_config_lang = array(
        'cdcourriers' => array()
    );

    public function __construct()
    {
        $this->name = 'cdcourriers';
        $this->tab = 'administration';
        $this->version = '1.0.0';
        $this->author = 'Dominique';
        $this->need_instance = 0;

        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Module Courriers');
        $this->description = $this->l('Courriers de relance clients');
        $this->confirmUninstall = $this->l('Are you sure you want to delete this module?');
    }

    public function install()
    {
        if (!parent::install() ||
            !$this->installConfig() ||
            !$this->registerHook('DisplayBackOfficeHeader') ||
            !$this->registerController()
        ) {
            return false;
        }
        return true;
    }

    public function uninstall()
    {
        if (!parent::uninstall() ||
            !$this->eraseConfig()
        ) {
            return false;
        }
        return true;
    }

    private function installConfig()
    {
        foreach ($this->config as $keyname => $value) {
            Configuration::updateValue($keyname, $value);
        }
        return true;
    }


    private function eraseConfig()
    {
        foreach ($this->config as $keyname => $value) {
            Configuration::deleteByName($keyname);
        }
        return true;
    }

    private function generatePDF()
    {
        $pdf = new MypdfClass('P', PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);

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

        $this->context->smarty->assign(array(
            'path_img' => _PS_MODULE_DIR_ . 'cdcourriers/img/'
        ));
        // set some text to print
        // add a page
        $pdf->AddPage();
        $html_content = $this->context->smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/header.tpl');
        $html_content .= $this->context->smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/relance.tpl');
        $html_content .= $this->context->smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/footer.tpl');
        $pdf->writeHTML($html_content);

        $pdf->AddPage();
        $html_content = $this->context->smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/header.tpl');
        $html_content .= $this->context->smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/relance_verso.tpl');
        $html_content .= $this->context->smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/footer.tpl');
        $pdf->writeHTML($html_content);

        $pdf->AddPage();
        $html_content = $this->context->smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/header.tpl');
        $html_content .= $this->context->smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/impaye.tpl');
        $html_content .= $this->context->smarty->fetch(_PS_MODULE_DIR_ . 'cdcourriers/views/templates/hook/pdf/footer.tpl');
        $pdf->writeHTML($html_content);


        // ---------------------------------------------------------

        //Close and output PDF document
        $pdf->Output('courriers' . '.pdf', 'I');
    }

    private function registerController()
    {
        $tab = new Tab();
        $tab->active = 1;
        $names = array(1 => 'AdminCourriers', 'AdminCourriers');
        foreach (Language::getLanguages() as $language) {
            $tab->name[$language['id_lang']] = isset($names[$language['id_lang']])
                ? $names[$language['id_lang']] : $names[1];
        }
        $tab->class_name = 'AdminCourriers';
        $tab->module = $this->name;
        $tab->id_parent = -1;

        return (bool)$tab->add();
    }

    public function hookDisplayBackOfficeHeader()
    {
        $this->context->controller->addJquery();
        $this->context->controller->addJS($this->_path . 'views/js/dist/remodal.js', 'all');
        $this->context->controller->addJS($this->_path . 'views/js/courriers.js', 'all');
        $this->context->controller->addCSS($this->_path . 'views/css/dist/remodal.css', 'all');
        $this->context->controller->addCSS($this->_path . 'views/css/dist/remodal-default-theme.css', 'all');

        return true;
    }
}

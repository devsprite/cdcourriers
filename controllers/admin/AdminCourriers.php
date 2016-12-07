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
 * @author  Dominique <dominique@chez-dominique.fr>
 * @copyright   2007-2016 Chez-dominique
 */

if (!defined('_PS_VERSION_')) {
    exit;
}

require_once(dirname(__FILE__) . '/../../classes/CourriersClass.php');

class AdminCourriersController extends ModuleAdminController
{
    public function __construct()
    {
        $this->module = 'cdcourriers';
        $this->className = 'AdminCourriers';
        $this->bootstrap = true;
        $this->lang = false;
        $this->list_no_link = true;
        $this->context = Context::getContext();
        $this->smarty = $this->context->smarty;

        parent::__construct();
    }

    public function postProcess()
    {
        if (Tools::isSubmit('relance') && Tools::getValue('relance') > 0) {
            CourriersClass::generateRelance(array((int)Tools::getValue('relance')), $this->context->employee->id_lang);
        } elseif (Tools::isSubmit('c_id_order') && Tools::getValue('c_id_order') > 0) {
            $lrar = pSQL(Tools::getValue('c_lrar'));
            CourriersClass::generateImpaye((int)Tools::getValue('c_id_order'), $lrar, $this->context->employee->id_lang);
        }
    }
}

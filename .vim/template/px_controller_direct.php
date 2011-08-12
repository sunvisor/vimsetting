<?php
/**
 * @{@strpart(expand('%:t:r'),1,255)@}@ Controller
 * File:    @{@expand('%:t')@}@
 * Auther:  sunvisor
 * Date:    @{@strftime('%Y-%m-%d')@}@
 * Copyright (C) Sunvisor @{@strftime('%Y')@}@ All right reserved.
 */
class @{@strpart(expand('%:t:r'),1,255)@}@ extends xFrameworkPX_Controller_ExtDirect
{

    public $modules = array(
        'module' => array( 'conn' => 'default' )
    );

}

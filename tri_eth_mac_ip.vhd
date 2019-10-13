----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/31/2019 02:59:03 PM
-- Design Name: 
-- Module Name: tri_eth_mac_ip - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
----------------------------------------------------------------------------------
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tri_eth_mac_ip is
  Port (
      s_axi_aclk : IN STD_LOGIC;
  s_axi_resetn : IN STD_LOGIC;
  gtx_clk : IN STD_LOGIC;
  gtx_clk90 : IN STD_LOGIC;
  glbl_rstn : IN STD_LOGIC;
  rx_axi_rstn : IN STD_LOGIC;
  tx_axi_rstn : IN STD_LOGIC;
  rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
  rx_statistics_valid : OUT STD_LOGIC;
  rx_mac_aclk : OUT STD_LOGIC;
  rx_reset : OUT STD_LOGIC;
  rx_enable : OUT STD_LOGIC;
  rx_axis_filter_tuser : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
  rx_axis_mac_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  rx_axis_mac_tvalid : OUT STD_LOGIC;
  rx_axis_mac_tlast : OUT STD_LOGIC;
  rx_axis_mac_tuser : OUT STD_LOGIC;
  tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  tx_statistics_vector : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
  tx_statistics_valid : OUT STD_LOGIC;
  tx_mac_aclk : OUT STD_LOGIC;
  tx_reset : OUT STD_LOGIC;
  tx_enable : OUT STD_LOGIC;
  tx_axis_mac_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  tx_axis_mac_tvalid : IN STD_LOGIC;
  tx_axis_mac_tlast : IN STD_LOGIC;
  tx_axis_mac_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
  tx_axis_mac_tready : OUT STD_LOGIC;
  pause_req : IN STD_LOGIC;
  pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
  speedis100 : OUT STD_LOGIC;
  speedis10100 : OUT STD_LOGIC;
  rgmii_txd : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  rgmii_tx_ctl : OUT STD_LOGIC;
  rgmii_txc : OUT STD_LOGIC;
  rgmii_rxd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  rgmii_rx_ctl : IN STD_LOGIC;
  rgmii_rxc : IN STD_LOGIC;
  inband_link_status : OUT STD_LOGIC;
  inband_clock_speed : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
  inband_duplex_status : OUT STD_LOGIC;
  mdio : INOUT STD_LOGIC;
  mdc : OUT STD_LOGIC;
  s_axi_awaddr : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
  s_axi_awvalid : IN STD_LOGIC;
  s_axi_awready : OUT STD_LOGIC;
  s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
  s_axi_wvalid : IN STD_LOGIC;
  s_axi_wready : OUT STD_LOGIC;
  s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
  s_axi_bvalid : OUT STD_LOGIC;
  s_axi_bready : IN STD_LOGIC;
  s_axi_araddr : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
  s_axi_arvalid : IN STD_LOGIC;
  s_axi_arready : OUT STD_LOGIC;
  s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
  s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
  s_axi_rvalid : OUT STD_LOGIC;
  s_axi_rready : IN STD_LOGIC;
  mac_irq : OUT STD_LOGIC
  
   );
end tri_eth_mac_ip;
----------------------------------------------------------------------------------
architecture Behavioral of tri_eth_mac_ip is
----------------------------------------------------------------------------------
COMPONENT tri_mode_ethernet_mac_0
  PORT (
    s_axi_aclk : IN STD_LOGIC;
    s_axi_resetn : IN STD_LOGIC;
    gtx_clk : IN STD_LOGIC;
    gtx_clk90 : IN STD_LOGIC;
    glbl_rstn : IN STD_LOGIC;
    rx_axi_rstn : IN STD_LOGIC;
    tx_axi_rstn : IN STD_LOGIC;
    rx_statistics_vector : OUT STD_LOGIC_VECTOR(27 DOWNTO 0);
    rx_statistics_valid : OUT STD_LOGIC;
    rx_mac_aclk : OUT STD_LOGIC;
    rx_reset : OUT STD_LOGIC;
    rx_enable : OUT STD_LOGIC;
    rx_axis_filter_tuser : OUT STD_LOGIC_VECTOR(4 DOWNTO 0); -------- 
    rx_axis_mac_tdata : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    rx_axis_mac_tvalid : OUT STD_LOGIC;
    rx_axis_mac_tlast : OUT STD_LOGIC;
    rx_axis_mac_tuser : OUT STD_LOGIC;
    tx_ifg_delay : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx_statistics_vector : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    tx_statistics_valid : OUT STD_LOGIC;
    tx_mac_aclk : OUT STD_LOGIC;
    tx_reset : OUT STD_LOGIC;
    tx_enable : OUT STD_LOGIC;
    tx_axis_mac_tdata : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    tx_axis_mac_tvalid : IN STD_LOGIC;
    tx_axis_mac_tlast : IN STD_LOGIC;
    tx_axis_mac_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    tx_axis_mac_tready : OUT STD_LOGIC;
    pause_req : IN STD_LOGIC;
    pause_val : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    speedis100 : OUT STD_LOGIC;
    speedis10100 : OUT STD_LOGIC;
    rgmii_txd : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
    rgmii_tx_ctl : OUT STD_LOGIC;
    rgmii_txc : OUT STD_LOGIC;
    rgmii_rxd : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    rgmii_rx_ctl : IN STD_LOGIC;
    rgmii_rxc : IN STD_LOGIC;
    inband_link_status : OUT STD_LOGIC;
    inband_clock_speed : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    inband_duplex_status : OUT STD_LOGIC;
    mdio : INOUT STD_LOGIC;
    mdc : OUT STD_LOGIC;
    s_axi_awaddr : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_axi_awvalid : IN STD_LOGIC;
    s_axi_awready : OUT STD_LOGIC;
    s_axi_wdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_wvalid : IN STD_LOGIC;
    s_axi_wready : OUT STD_LOGIC;
    s_axi_bresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_bvalid : OUT STD_LOGIC;
    s_axi_bready : IN STD_LOGIC;
    s_axi_araddr : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    s_axi_arvalid : IN STD_LOGIC;
    s_axi_arready : OUT STD_LOGIC;
    s_axi_rdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axi_rresp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    s_axi_rvalid : OUT STD_LOGIC;
    s_axi_rready : IN STD_LOGIC;
    mac_irq : OUT STD_LOGIC
  );
END COMPONENT;
----------------------------------------------------------------------------------
begin
----------------------------------------------------------------------------------
ins : tri_mode_ethernet_mac_0
  PORT MAP (
    s_axi_aclk => s_axi_aclk,
    s_axi_resetn => s_axi_resetn,
    gtx_clk => gtx_clk,
    gtx_clk90 => gtx_clk90,
    glbl_rstn => glbl_rstn,
    rx_axi_rstn => rx_axi_rstn,
    tx_axi_rstn => tx_axi_rstn,
    rx_statistics_vector => rx_statistics_vector,
    rx_statistics_valid => rx_statistics_valid,
    rx_mac_aclk => rx_mac_aclk,
    rx_reset => rx_reset,
    rx_enable => rx_enable,
    rx_axis_filter_tuser => rx_axis_filter_tuser,
    rx_axis_mac_tdata => rx_axis_mac_tdata,
    rx_axis_mac_tvalid => rx_axis_mac_tvalid,
    rx_axis_mac_tlast => rx_axis_mac_tlast,
    rx_axis_mac_tuser => rx_axis_mac_tuser,
    tx_ifg_delay => tx_ifg_delay,
    tx_statistics_vector => tx_statistics_vector,
    tx_statistics_valid => tx_statistics_valid,
    tx_mac_aclk => tx_mac_aclk,
    tx_reset => tx_reset,
    tx_enable => tx_enable,
    tx_axis_mac_tdata => tx_axis_mac_tdata,
    tx_axis_mac_tvalid => tx_axis_mac_tvalid,
    tx_axis_mac_tlast => tx_axis_mac_tlast,
    tx_axis_mac_tuser => tx_axis_mac_tuser,
    tx_axis_mac_tready => tx_axis_mac_tready,
    pause_req => pause_req,
    pause_val => pause_val,
    speedis100 => speedis100,
    speedis10100 => speedis10100,
    rgmii_txd => rgmii_txd,
    rgmii_tx_ctl => rgmii_tx_ctl,
    rgmii_txc => rgmii_txc,
    rgmii_rxd => rgmii_rxd,
    rgmii_rx_ctl => rgmii_rx_ctl,
    rgmii_rxc => rgmii_rxc,
    inband_link_status => inband_link_status,
    inband_clock_speed => inband_clock_speed,
    inband_duplex_status => inband_duplex_status,
    mdio => mdio,
    mdc => mdc,
    s_axi_awaddr => s_axi_awaddr,
    s_axi_awvalid => s_axi_awvalid,
    s_axi_awready => s_axi_awready,
    s_axi_wdata => s_axi_wdata,
    s_axi_wvalid => s_axi_wvalid,
    s_axi_wready => s_axi_wready,
    s_axi_bresp => s_axi_bresp,
    s_axi_bvalid => s_axi_bvalid,
    s_axi_bready => s_axi_bready,
    s_axi_araddr => s_axi_araddr,
    s_axi_arvalid => s_axi_arvalid,
    s_axi_arready => s_axi_arready,
    s_axi_rdata => s_axi_rdata,
    s_axi_rresp => s_axi_rresp,
    s_axi_rvalid => s_axi_rvalid,
    s_axi_rready => s_axi_rready,
    mac_irq => mac_irq
  );
----------------------------------------------------------------------------------
end Behavioral;
----------------------------------------------------------------------------------
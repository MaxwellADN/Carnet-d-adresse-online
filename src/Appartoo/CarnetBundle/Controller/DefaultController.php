<?php

namespace Appartoo\CarnetBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Appartoo\CarnetBundle\Entity\Membre;
use Appartoo\CarnetBundle\Entity\user;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{	
	
	// affichage des membres a l'accueil 
    public function indexAction()
    {	
	
	$em = $this->getDoctrine()->getManager();
	
	$id = $this->container->get('security.context')->getToken()->getUser()->getId();
	
	$user = $em
      ->getRepository('AppartooUserBundle:Utilisateur')
      ->find($id)
    ;

    if (null === $user) {
      throw new NotFoundHttpException("L'annonce d'id ".$id." n'existe pas.");
    }

    
    $listmembre = $em
      ->getRepository('AppartooCarnetBundle:Membre')
      ->findBy(array('Utilisateur' => $user))
    ;
	

    return $this->render('AppartooCarnetBundle:Membre:index.html.twig', array('listmembre' => $listmembre));

		
    }
	
	
	// Controller qui permet de renvoyer et traiter l'ajout d'un membre
	public function addAction(Request $request)
	{	
		$membre= new Membre();
		
		$formBuilder = $this->get('form.factory')->createBuilder('form', $membre);
		
		$formBuilder
		->add('nom', 'text')
		->add('prenom', 'text')
		->add('email', 'text')
		->add('adresse', 'textarea')
		->add('tel', 'text')
		->add('siteweb', 'text')
		->add('enregistrer', 'submit');
		
		// recuperer le formulaire
		$form= $formBuilder->getForm();
		
		//traitement du formulaire 
		$form->handleRequest($request);
		
		//verification des valeur 
		if($form->isValid())
		{	
			$membre->setUtilisateur($this->container->get('security.context')->getToken()->getUser());
			$em = $this->getDoctrine()->getManager();
			$em->persist($membre);
			$em->flush();
			
			$request->getSession()->getFlashBag()->add('notice', 'Contact bien enregistré.');
			
			return $this->redirect($this->generateUrl('appartoo_carnet_homepage', array('id' => $membre->getId())));
		}
		 
		 return $this-> render('AppartooCarnetBundle:Membre:add.html.twig', array('form' => $form->createView(),) );
	}
	
	public function delAction(Membre $membre)
	{	
			 $form = $this->createFormBuilder()->getForm();

			$request = $this->getRequest();
			if ($request->getMethod() == 'POST') {
				
			  $form->bind($request);

			  if ($form->isValid()) { 
				$em = $this->getDoctrine()->getManager();
				$em->remove($membre);
				$em->flush();

			
				$this->get('session')->getFlashBag()->add('info', 'Contact bien supprimé');

				
			return $this->redirect($this->generateUrl('appartoo_carnet_homepage'));
			  }
			  
			}
			return $this-> render('AppartooCarnetBundle:Membre:delete.html.twig', array(
               'membre' => $membre,
               'form'    => $form->createView() ));
		
		 
		
	}
	
	public function editAction(Membre $membre, $id)
	{
		$em = $this->getDoctrine()->getManager();
		$membre = $em
			  ->getRepository('AppartooCarnetBundle:Membre')
			  ->find($id)
			;
		$formBuilder = $this->get('form.factory')->createBuilder('form', $membre);
		$formBuilder
		->add('nom', 'text')
		->add('prenom', 'text')
		->add('email', 'text')
		->add('adresse', 'textarea')
		->add('tel', 'text')
		->add('siteweb', 'text')
		->add('enregistrer', 'submit');
		
		$form = $formBuilder->getForm();
		
		$request = $this->getRequest();
		if ($request->getMethod() == 'POST') {
			
			$form->bind($request);
			if ($form->isValid())
			{
			$em = $this->getDoctrine()->getManager();
			$em->persist($membre);
			$em->flush();
			$this->get('session')->getFlashBag()->add('info', 'Le contact a été correctement modifié');
			return $this->redirect($this->generateUrl('appartoo_carnet_homepage'));
			}
			
		}
		return $this-> render('AppartooCarnetBundle:Membre:edit.html.twig', array(
               'membre' => $membre,
			   'id'=>$id,
               'form'    => $form->createView() ));
	}
}

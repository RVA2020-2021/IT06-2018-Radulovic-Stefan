package rva.ctrls;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import rva.jpa.Status;
import rva.repository.StatusRepository;

@CrossOrigin
@RestController
@Api(tags = {"Status CRUD operacije"})
public class StatusRestController {
	
	@Autowired
	private StatusRepository statusRepository;
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@GetMapping("status")
	@ApiOperation(value = "Vraca kolekciju svih statusa iz baze podataka")
	public Collection<Status> getStatusi() {
		return statusRepository.findAll();
	}
	
	@GetMapping("status/{id}")
	@ApiOperation(value = "Vraca status u odnosu na posledjenu vrednost path varijable id")
	public Status getStatus(@PathVariable("id") Integer id) {
		return statusRepository.getOne(id);
	}
	
	@GetMapping("statusNaziv/{naziv}")
	@ApiOperation(value = "Vraca kolekciju statusa koji imaju naziv koji sadrzi vrednost prosledjenu u okviru path varijable naziv")
	public Collection<Status> getStatusByNaziv(@PathVariable("naziv") String naziv) {
		return statusRepository.findByNazivContainingIgnoreCase(naziv);
	}
	
	@PostMapping("status")
	@ApiOperation(value = "Dodaje novi status u bazu podataka")
	public ResponseEntity<Status> insertStatus(@RequestBody Status status) {
		if(!statusRepository.existsById(status.getId())) {
			statusRepository.save(status);
			return new ResponseEntity<Status>(HttpStatus.OK);
		}
		return new ResponseEntity<Status>(HttpStatus.CONFLICT);
	}
	
	@PutMapping("status")
	@ApiOperation(value = "Update-uje postojeci status")
	public ResponseEntity<Status> updateStatus(@RequestBody Status status) {
		if(!statusRepository.existsById(status.getId())) {
			return new ResponseEntity<Status>(HttpStatus.NO_CONTENT);
		}
		statusRepository.save(status);
		return new ResponseEntity<Status>(HttpStatus.OK);
	}
	
	@DeleteMapping("status/{id}")
	@ApiOperation(value = "Brise status u odnosu na vrednost posledjene path varijable id")
	public ResponseEntity<Status> deleteStatus(@PathVariable("id") Integer id) {
		if(!statusRepository.existsById(id)) {
			return new ResponseEntity<Status>(HttpStatus.NO_CONTENT); 
		}
		statusRepository.deleteById(id);
		if(id == -100) {
			jdbcTemplate.execute(" INSERT INTO \"status\" (\"id\", \"naziv\", \"oznaka\") "
					+ "VALUES (-100, 'Test naziv', 'Test oznaka')");
		}
		return new ResponseEntity<Status>(HttpStatus.OK);
	}
	
}
